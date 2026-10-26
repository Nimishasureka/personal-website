document.querySelectorAll('[data-blog-grid]').forEach(grid => {
  const posts = window.NIMISHA_BLOG_POSTS || [];
  const limit = Number(grid.dataset.limit) || posts.length;
  posts.slice(0, limit).forEach(post => {
    const card = document.createElement('article');
    card.className = 'blog-card';

    const cover = document.createElement('img');
    cover.className = 'blog-card-cover';
    cover.src = post.cover;
    cover.alt = post.coverAlt || '';
    cover.loading = 'lazy';
    card.append(cover);

    const content = document.createElement('div');
    content.className = 'blog-card-content';
    const meta = document.createElement('div');
    meta.className = 'blog-card-meta';
    const category = document.createElement('span');
    category.textContent = post.category;
    const state = document.createElement('span');
    state.textContent = post.dateDisplay || (post.url ? 'Article' : 'Coming soon');
    meta.append(category, state);
    const title = document.createElement('h3');
    title.textContent = post.title;
    const summary = document.createElement('p');
    summary.textContent = post.summary;
    const action = document.createElement(post.url ? 'a' : 'span');
    action.className = post.url ? 'arrow-link blog-card-action' : 'blog-card-upcoming';
    action.textContent = post.url ? 'Read article ↗' : 'In the works ✳';
    if (post.url) action.href = post.url;
    content.append(meta, title, summary, action);
    card.append(content);
    grid.append(card);
  });
});
