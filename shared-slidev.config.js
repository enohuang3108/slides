import { readFileSync } from 'node:fs'

/**
 * 自動產生 Slidev 配置，適用於 GitHub Pages monorepo 部署
 * @param {string} [fallbackRepoName] - 備用的 repository 名稱
 */
export function createSlidevConfig(fallbackRepoName = 'mono-slidev') {
  // Auto-detect project info from local package.json
  const packageJson = JSON.parse(readFileSync('./package.json', 'utf-8'))
  const projectName = packageJson.name

  // Auto-detect repository name from root package.json or environment
  let repoName = fallbackRepoName
  try {
    const rootPackageJson = JSON.parse(readFileSync('../../package.json', 'utf-8'))
    repoName = rootPackageJson.name
  } catch {
    // Use environment variable if available (useful for CI/CD)
    repoName = process.env.GITHUB_REPOSITORY?.split('/')[1] || repoName
  }

  return {
    // GitHub Pages base path configuration
    routerMode: 'hash',

    // Build configuration for GitHub Pages
    build: {
      base: '/talks/my-cool-talk/'
    }
  }
}
