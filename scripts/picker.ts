import { execa } from "execa";
import fs from "node:fs/promises";
import process from "node:process";
import { fileURLToPath } from "node:url";
import prompts from "prompts";

async function startPicker(args: string[]) {
  const topFolders = (
    await fs.readdir(new URL("..", import.meta.url), { withFileTypes: true })
  )
    .filter((dirent) => dirent.isDirectory())
    .map((dirent) => dirent.name)
    .filter((folder) => folder.match(/^\d{4}/) || folder === "demo");

  const allProjects: { name: string; path: string; title: string }[] = [];
  for (const topFolder of topFolders) {
    const subFolders = await fs.readdir(
      new URL(`../${topFolder}`, import.meta.url),
      { withFileTypes: true }
    );
    const projects = subFolders
      .filter((dirent) => dirent.isDirectory())
      .map((dirent) => ({
        name: `${topFolder}/${dirent.name}`,
        path: `${topFolder}/${dirent.name}`,
        title: `${topFolder}/${dirent.name}`,
      }));
    allProjects.push(...projects);
  }

  const result = args.includes("-y")
    ? { project: allProjects[0] }
    : await prompts([
        {
          type: "select",
          name: "project",
          message: "Pick a project",
          choices: allProjects.map((project) => ({
            title: project.title,
            value: project,
          })),
        },
      ]);

  args = args.filter((arg) => arg !== "-y");

  if (result.project) {
    if (args[0] === "dev")
      execa("code", [
        fileURLToPath(
          new URL(`../${result.project.path}/slides.md`, import.meta.url)
        ),
      ]);
    await execa("pnpm", ["run", ...args], {
      cwd: new URL(`../${result.project.path}`, import.meta.url),
      stdio: "inherit",
    });
  }
}

await startPicker(process.argv.slice(2));
