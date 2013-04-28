<?php
defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers'); 

require_once dirname(__FILE__) . str_replace('/', DIRECTORY_SEPARATOR, '/../../../functions.php');

$component = new ArtxContent($this, $this->params);
?>
<ul id="archive-items">
<?php foreach ($this->items as $i => $item) : ?>
    <li class="row<?php echo $i % 2; ?>">
<?php
$article = $component->article('archive', $item, $this->params);
$params = $article->getArticleViewParameters();
if (strlen($article->title)) {
    $params['header-text'] = $this->escape($article->title);
    if (strlen($article->titleLink))
        $params['header-link'] = $article->titleLink;
}
// Build article content
$content = '';
if (strlen($article->intro))
    $content .= $article->intro($article->intro);
$params['content'] = $content;
// Render article
echo $article->article($params);

?>
    </li>
<?php endforeach; ?>
</ul>
<div class="pagination">
    <p class="counter">
        <?php echo $this->pagination->getPagesCounter(); ?>
    </p>
    <?php echo $this->pagination->getPagesLinks(); ?>
</div>
