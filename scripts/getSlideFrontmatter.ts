import { readFileSync, readdirSync, existsSync } from "node:fs";
import { join, dirname } from "node:path";
import { parse as parseYaml } from "yaml";
import { fileURLToPath } from "node:url";

// Define the structure for slide frontmatter
interface SlideFrontmatter {
  theme?: string;
  background?: string;
  title?: string;
  info?: string;
  class?: string;
  drawings?: {
    persist?: boolean;
  };
  transition?: string;
  mdc?: boolean;
  seoMeta?: {
    ogImage?: string;
    ogTitle?: string;
    ogDescription?: string;
  };
  [key: string]: any;
}

// Define the structure for slide information
interface SlideInfo {
  path: string;
  frontmatter: SlideFrontmatter;
  content: string;
}

// Get the frontmatter and content of a single slide (legacy function)
export function getSlideFrontmatter(slidePath: string): SlideInfo | null {
  return getSlideFrontmatterFromPath(slidePath);
}

// Get the frontmatter and content for all slides in the slides directory
export function getAllSlidesFrontmatter(): SlideInfo[] {
  const baseDir = join(dirname(fileURLToPath(import.meta.url)), "..");
  const slides: SlideInfo[] = [];
  
  // Check demo directory
  const demoDir = join(baseDir, "demo");
  if (existsSync(demoDir)) {
    const demoDirs = readdirSync(demoDir, { withFileTypes: true })
      .filter((dirent) => dirent.isDirectory())
      .map((dirent) => dirent.name);
    
    for (const slideDir of demoDirs) {
      const slideInfo = getSlideFrontmatterFromPath(join("demo", slideDir));
      if (slideInfo) {
        slides.push(slideInfo);
      }
    }
  }
  
  // Check 2025 directory
  const year2025Dir = join(baseDir, "2025");
  if (existsSync(year2025Dir)) {
    const year2025Dirs = readdirSync(year2025Dir, { withFileTypes: true })
      .filter((dirent) => dirent.isDirectory())
      .map((dirent) => dirent.name);
    
    for (const slideDir of year2025Dirs) {
      const slideInfo = getSlideFrontmatterFromPath(join("2025", slideDir));
      if (slideInfo) {
        slides.push(slideInfo);
      }
    }
  }

  return slides;
}

// Helper function to get slide frontmatter from a specific path
function getSlideFrontmatterFromPath(relativePath: string): SlideInfo | null {
  try {
    const fullPath = join(
      dirname(fileURLToPath(import.meta.url)),
      "..",
      relativePath,
      "slides.md"
    );

    if (!existsSync(fullPath)) {
      console.warn(`File not found: ${fullPath}`);
      return null;
    }

    const content = readFileSync(fullPath, "utf8");
    const frontmatterMatch = content.match(/^---\s*\n([\s\S]*?)\n---\s*\n/);

    if (!frontmatterMatch) {
      console.warn(`Frontmatter not found in ${relativePath}/slides.md`);
      return null;
    }

    const frontmatterYaml = frontmatterMatch[1];
    const frontmatter = parseYaml(frontmatterYaml) as SlideFrontmatter;

    return {
      path: relativePath,
      frontmatter,
      content: content.replace(frontmatterMatch[0], ""),
    };
  } catch (error) {
    console.error(`Error parsing frontmatter for ${relativePath}:`, error);
    return null;
  }
}

// If this file is run directly, output all slides' frontmatter
if (import.meta.url === `file://${process.argv[1]}`) {
  const slides = getAllSlidesFrontmatter();
  console.log(JSON.stringify(slides, null, 2));
}
