$(document).ready(function() {
  // the file extension regex matching on supported image and pdf types
  var extensionRegex = /\.(png|jpe?g|gif|pdf)$/i;

  // modify thumbnail links in wiki content -> add filename from ./img/@alt to url to support fancybox preview
  $("div.wiki a.thumbnail").attr('href', function(i, v){
    return v.replace(/\/attachments\/(\d+)/g,'/attachments/download/$1') + '/' + $(this).children('img').attr('alt').replace(/(.*\.(png|jpe?g|gif))(\s\(.*\))?/gi,'$1');
  });

  // modify thumbnails and magnifier links in journal details -> add filename to url to support fancybox preview
  $("div.journal div.thumbnails a, div.journal ul.details li a:not([title])").attr('href', function(i, v){
    if($(this).attr('href').match(extensionRegex)) {
      return v.replace(/\/attachments\/(\d+)/g,'/attachments/download/$1');
    } else {
      return v;
    }
  });

  // add a magnifier icon before download icon for images and pdf
  $("div.journal ul.details li a.icon-download").each(function(i, obj) {
    if($(this).attr('href').match(extensionRegex)) {
      var icon = $(this).clone().attr('class', function(i, v){
        return v.replace(/-download/g,'-magnifier');
      });
      icon.insertBefore($(this));
    }
  });

  // add rel attribute to thumbnails of the same journal entry
  $("div.journal div.thumbnails a").attr('rel', function(i, v){
    return 'thumbnails-' + $(this).closest('div.journal').attr('id');
  });

  // #40 DMSF support: add class="thumbnail" to DMSF macro thumbnails
  $("div.wiki a[data-downloadurl][href^='/dmsf/files/'][href$='/view']").each(function(i, obj) {
    var filename = $(this).attr('data-downloadurl').split(':')[1];
    // Also support PDF preview in lightbox
    var isPdf = filename.match(/\.pdf$/i);
    // only apply thumbnail class to image and pdf links
    if(filename.match(extensionRegex)) {
      $(this)
        .attr('class', 'thumbnail')
        .attr('data-fancybox-type', isPdf ? 'iframe' : 'image')
        .attr('title', filename)
        .removeAttr('target')
        .removeAttr('data-downloadurl');
    }
  });

  // #53 DMSF support in issues: add class="lightbox" to DMSF thumbnails and preview links
  $("div.attachments.dmsf_parent_container a[href^='/dmsf/files/'][href$='/view']").each(function(i, obj) {
    // extract filename from attribute 'data-downloadurl' from closest element with the same 'href'
    var href = $(this).attr('href');
    var filename = $("div.attachments.dmsf_parent_container > p > a[href='" + href + "'].dmsf-icon-file").first().attr('data-downloadurl').split(':')[1];
    // create 3 fancybox 'rel' groups to avoid image duplicates in slideshow
    var relgroup = '';
    if($(this).closest('div.thumbnails').length) {
      relgroup = 'thumbnails';
    } else if($(this).hasClass('icon-only')) {
      relgroup = 'icon';
    } else if($(this).hasClass('thumbnail')) {
      relgroup = 'imagelink';
    }
    // Also support PDF preview in lightbox
    var isPdf = filename.match(/\.pdf$/i);
    // only apply thumbnail class to image and pdf links
    if(filename.match(extensionRegex)) {
      $(this)
        .addClass('lightbox')
        .attr('data-fancybox-type', isPdf ? 'iframe' : 'image')
        .attr('title', filename)
        .attr('rel', 'dmsf-' + relgroup);
        // do not remove 'data-downloadurl' here otherwise the filename extraction crashes for following dmsf thumbnails
    }
  });

  // Add Fancybox to image links
  $("div.attachments a.lightbox," +
    "div.attachments a.lightbox_preview," +
    "div.journal ul.details a[href$='.png']:not(.icon-download)," +
    "div.journal ul.details a[href$='.PNG']:not(.icon-download)," +
    "div.journal ul.details a[href$='.jpg']:not(.icon-download)," +
    "div.journal ul.details a[href$='.JPG']:not(.icon-download)," +
    "div.journal ul.details a[href$='.jpeg']:not(.icon-download)," +
    "div.journal ul.details a[href$='.JPEG']:not(.icon-download)," +
    "div.journal ul.details a[href$='.gif']:not(.icon-download)," +
    "div.journal ul.details a[href$='.GIF']:not(.icon-download)," +
    "div.journal div.thumbnails a," +
    "div.wiki a.thumbnail," +
    "div.attachments a.swf," +
    ".avatar a").fancybox({
      prevEffect    : 'none',
      nextEffect    : 'none',
      openSpeed     : 300,
      closeSpeed    : 150
  });

    // Add Fancybox to PDF links
  $("div.attachments a.pdf," +
    "div.journal ul.details a[href$='.pdf']:not(.icon-download)," +
    "div.journal ul.details a[href$='.PDF']:not(.icon-download)," +
    "div.journal div.thumbnails a[href$='.pdf']," +
    "div.journal div.thumbnails a[href$='.PDF']").fancybox({
      type          : 'iframe',
      prevEffect    : 'none',
      nextEffect    : 'none',
      openSpeed     : 300,
      closeSpeed    : 150,
      width         : '90%',
      height        : '90%',
      autoSize      : true,
      iframe : {
        preload: false
      }
  });
});
