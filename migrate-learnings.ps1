$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$source = Join-Path $root 'content/learnings'
$template = Get-Content -LiteralPath (Join-Path $root 'templates/article.html') -Raw -Encoding UTF8
$outDir = Join-Path $root 'dist/blog'
New-Item -ItemType Directory -Path $outDir -Force | Out-Null

$posts = @(
  @{ File='2020-05-06-internal-mobility.md'; Slug='people-analytics-internal-mobility'; Date='May 6, 2020'; Intro='What predicts success after a promotion? A look at internal mobility and the qualities that make a strong manager.'; Minutes='3' },
  @{ File='2020-04-16-People-analytics-post.md'; Slug='people-analytics-performance-evaluation-part-2'; Date='April 16, 2020'; Intro='Small samples, independent perspectives, and the difference between a sound process and a good outcome.'; Minutes='5' },
  @{ File='2020-04-06-Staffing.md'; Slug='people-analytics-staffing'; Date='April 6, 2020'; Intro='How can organizations hire for the right fit? Exploring predictors of performance, interviews, and people data.'; Minutes='6' },
  @{ File='2020-04-04-my-first-post.md'; Slug='people-analytics-performance-evaluation'; Date='April 4, 2020'; Intro='My early notes on people analytics: innovation in HR, separating luck from skill, and regression to the mean.'; Minutes='5' }
)

foreach ($post in $posts) {
  $raw = Get-Content -LiteralPath (Join-Path $source $post.File) -Raw -Encoding UTF8
  $title = [regex]::Match($raw, '(?m)^title:\s*(.+?)\s*$').Groups[1].Value.Trim()
  $body = [regex]::Replace($raw, '(?s)^---\s*\r?\n.*?\r?\n---\s*\r?\n', '')
  $body = $body.Replace('{{ site.baseurl }}/images/Predicting performance.PNG', '../images/predicting-performance.png')
  $body = $body.Replace('![](../images/predicting-performance.png', '![Chart comparing hiring methods by correlation with subsequent performance](../images/predicting-performance.png')
  $bodyHtml = (ConvertFrom-Markdown -InputObject $body).Html
  $sourceUrl = 'https://github.com/Nimishasureka/learnings/blob/master/_posts/' + $post.File
  $bodyHtml += "`n<p class=`"article-source`">Originally published on <a href=`"https://nimishasureka.github.io/learnings/`" target=`"_blank`" rel=`"noopener noreferrer`">Learnings</a> in 2020. <a href=`"$sourceUrl`" target=`"_blank`" rel=`"noopener noreferrer`">View the original post</a>.</p>"
  $html = $template
  $html = $html.Replace('{{ARTICLE_DESCRIPTION}}', [System.Net.WebUtility]::HtmlEncode($post.Intro))
  $html = $html.Replace('{{ARTICLE_TITLE}}', [System.Net.WebUtility]::HtmlEncode($title))
  $html = $html.Replace('{{ARTICLE_CATEGORY}}', 'PEOPLE ANALYTICS')
  $html = $html.Replace('{{TWO_SENTENCE_INTRO}}', [System.Net.WebUtility]::HtmlEncode($post.Intro))
  $html = $html.Replace('{{PUBLISH_DATE}}', $post.Date)
  $html = $html.Replace('{{READ_TIME}}', $post.Minutes)
  $html = [regex]::Replace($html, '(?s)      <p>\{\{OPENING_PARAGRAPH\}\}</p>.*?      <div class="article-end">', "      $bodyHtml`n      <div class=`"article-end`">")
  $html = [regex]::Replace($html, '<!-- Copy to dist/blog/your-article-slug.html, then replace every \{\{PLACEHOLDER\}\}\. -->\r?\n', '')
  if ($html -match '\{\{[^}]+\}\}') { throw "Unfilled placeholder in $($post.Slug)" }
  Set-Content -LiteralPath (Join-Path $outDir ($post.Slug + '.html')) -Value $html -Encoding UTF8
}
Write-Output "Generated $($posts.Count) articles."
