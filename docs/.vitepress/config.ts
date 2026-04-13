import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'La Brigade du Code',
  description: 'A mise-en-place codelab for full stack developers',
  base: '/la-brigade-du-code/',
  head: [
    ['link', { rel: 'icon', href: '/la-brigade-du-code/favicons/favicon.ico', sizes: 'any' }],
    ['link', { rel: 'icon', type: 'image/png', sizes: '32x32', href: '/la-brigade-du-code/favicons/favicon-32x32.png' }],
    ['link', { rel: 'icon', type: 'image/png', sizes: '16x16', href: '/la-brigade-du-code/favicons/favicon-16x16.png' }],
    ['link', { rel: 'apple-touch-icon', sizes: '180x180', href: '/la-brigade-du-code/favicons/apple-touch-icon-180x180.png' }],
    ['link', { rel: 'mask-icon', href: '/la-brigade-du-code/favicons/safari-pinned-tab.svg', color: '#F97316' }],
  ],
  themeConfig: {
    logo: '🍳',
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Labs', link: '/lab-00/' },
      { text: '📽️ Slides', link: 'https://maoudia.github.io/la-brigade-du-code/slides/', target: '_blank' },
      { text: 'mise docs ↗', link: 'https://mise.jdx.dev', target: '_blank', rel: 'noopener noreferrer' }
    ],
    sidebar: [
      { text: '🔧 Lab 00 — Onboarding', link: '/lab-00/' },
      { text: '🍳 Lab 01 — La Mise en Place', link: '/lab-01/' },
      { text: '🧅 Lab 02 — Les Ingredients', link: '/lab-02/' },
      { text: '🥘 Lab 03 — Les Recettes', link: '/lab-03/' },
      { text: '🔥 Lab 04 — Le Coup de Feu', link: '/lab-04/' },
      { text: '🍽️ Lab 05 — Le Service', link: '/lab-05/' },
      { text: '👨‍🍳 Lab 06 — Le Chef', link: '/lab-06/' },
      { text: '🤖 Lab 07 — Le Sous-Chef Digital', link: '/lab-07/' },
      { text: '📚 Appendix — All Features', link: '/appendix/' },
      { text: '🗺️ Diagrams', link: '/diagrams/' }
    ],
    socialLinks: [
      { icon: 'github', link: 'https://github.com/maoudia/la-brigade-du-code' }
    ],
    footer: {
      message: 'La Brigade du Code — mise codelab',
      copyright: 'MIT License'
    }
  }
})
