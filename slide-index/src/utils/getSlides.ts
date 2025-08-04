import slidesData from 'virtual:slides-data'

export function getSlides() {
  try {
    if (slidesData && slidesData.length > 0) {
      return slidesData.map((slide) => ({
        title: slide.frontmatter.title || slide.path,
        url: `./${slide.path}/`,
        description: slide.frontmatter.info || slide.frontmatter.seoMeta?.ogDescription || 'No description available',
        image: slide.frontmatter.seoMeta?.ogImage || 'https://picsum.photos/300/200',
        author: 'Eno Yao',
        date: new Date().toISOString().split('T')[0],
        theme: slide.frontmatter.theme || 'default',
        transition: slide.frontmatter.transition,
        class: slide.frontmatter.class,
      }))
    }
  } catch (error) {
    console.error('Error reading slides frontmatter:', error)
  }

  return []
}

if (import.meta.hot) {
  import.meta.hot.accept('virtual:slides-data', (newSlidesData) => {
    console.log('Slides data updated')
  })
}
