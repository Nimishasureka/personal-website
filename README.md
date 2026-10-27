# Nimisha Sureka's portfolio

A static, responsive personal website. The site content lives in `dist/index.html`; layout and colors live in `dist/styles.css`.

## Content status

- Five project cards now link to work Nimisha supplied directly: Notion onboarding guides and their parent handbook, the Formula 1 AI steward notebook, two Kaggle leaderboards, and Skinmate. They appear in Nimisha's requested order, with onboarding first and Skinmate last.
- The 5th-of-700 and top-2% results are Nimisha's descriptions. The Kaggle leaderboard links are included so the results can be inspected.
- The learning path follows Nimisha's account of CS50, Python lessons and bootcamps, Kaggle practice, and Vercel v0.
- Mindfulness, fitness, board games, and acrylic painting were supplied by Nimisha.
- Four posts from Nimisha's earlier [Learnings](https://nimishasureka.github.io/learnings/) blog have been migrated as full on-site articles. Their original Markdown is kept in `content/learnings/`; run `./migrate-learnings.ps1` to regenerate the HTML pages.
- “Making leadership learning stick” is an original article hosted at `dist/blog/making-leadership-learning-stick.html`; its card is featured first on the homepage and blog page.
- The blog also links to Nimisha's existing [Connect Virtually](https://connectvirtually.substack.com/) Substack archive. Future articles can live on this website too.

## Adding a project

Copy one of the `<article class="project-card">` blocks in `dist/index.html`. Include:

1. Project title and year
2. Your role and what you did
3. An outcome you can verify or describe publicly
4. A public case study, GitHub, article, or other project link

For employer projects, use only details you are comfortable making public. The Site can be updated with new cards whenever projects are ready.

## Publishing a blog post on this site

The homepage blog section and `dist/blog.html` use the same entries in `dist/blog-posts.js`.

1. Copy `templates/article.html` to `dist/blog/<short-slug>.html`.
2. Replace every `{{PLACEHOLDER}}` in the new file with the article's title, introduction, date, and full text. Keep drafts outside `dist/` until ready to publish.
3. Add a cover image to `dist/images/` (SVG, PNG, or WebP).
4. Add a new entry at the top of `dist/blog-posts.js` with its title, category, cover, and two-sentence summary. Set `url` to `blog/<short-slug>.html`.
5. Deploy the updated static files to the personal domain. The article will then open on this same website.

The card summary is limited to two lines in the layout.

## Project links

- [Nimisha's LinkedIn profile](https://www.linkedin.com/in/nimishasureka/)
- [Onboarding Guides](https://glory-nut-5e5.notion.site/Onboarding-Guides-b231a73946404e9cb3cf1a27926e83dd)
- [Full Company Handbook](https://glory-nut-5e5.notion.site/Company-Handbook-7fa2108554b7458fb58d31a8565af4a2)
- [Formula 1 AI steward notebook](https://www.kaggle.com/code/byteliberator/gemini-long-context-formula-1-ai-steward)
- [WiDS Datathon 2024 Challenge 1 leaderboard](https://www.kaggle.com/competitions/widsdatathon2024-challenge1/leaderboard)
- [Cirrhosis outcomes Kaggle leaderboard](https://www.kaggle.com/competitions/playground-series-s3e26/leaderboard)
- [Skinmate](https://skinmate.vercel.app)
- [Connect Virtually on Substack](https://connectvirtually.substack.com/)

## Local preview

Run `node preview.cjs` from this folder and open `http://127.0.0.1:4173/`.

## Hosting

The `dist/` directory is the complete static site and can be deployed to GitHub Pages. All internal links are relative so it can be hosted from a project subpath.
