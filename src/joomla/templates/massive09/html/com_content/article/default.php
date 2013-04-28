<?php
defined('_JEXEC') or die;

require_once dirname(__FILE__) . str_replace('/', DIRECTORY_SEPARATOR, '/../../../functions.php');

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers');

$component = new ArtxContent($this, $this->params);
$article = $component->article('article', $this->item, $this->item->params, array('print' => $this->print));

echo $component->beginPageContainer('item-page');
if (strlen($article->pageHeading))
    echo $component->pageHeading($article->pageHeading);
$params = $article->getArticleViewParameters();
if (strlen($article->title)) {
    $params['header-text'] = $this->escape($article->title);
    if (strlen($article->titleLink))
        $params['header-link'] = $article->titleLink;
}
// Build article content
$content = '';
if (!$article->introVisible)
    $content .= $article->event('afterDisplayTitle');
$content .= $article->event('beforeDisplayContent');
if (strlen($article->toc))
    $content .= $article->toc($article->toc);
if (strlen($article->text))
    $content .= $article->text($article->text);
if ($article->introVisible)
    $content .= $article->intro($article->intro);
if (strlen($article->readmore))
    $content .= $article->readmore($article->readmore, $article->readmoreLink);
$content .= $article->event('afterDisplayContent');
$params['content'] = $content;
// Render article
echo $article->article($params);
echo $component->endPageContainer();

