<?php
/*********************************
 * Facebook Side Tab for opencart 1.5.4 - 1.5.6
 * by George Dimitrakopoulos 2015
 * contact at gdimi@hyperworks.gr
 * version 1.0

@copyright
This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
        $hc = ($hideCover == 'on') ? 'true' : 'false';
        $sf = ($showFaces == 'on') ? 'true' : 'false';
        $spp = ($showPagePosts == 'on') ? 'true' : 'false';
        $dw = ($dataWidth) ? 'data-width="'.$dataWidth.'"' : '';
        $dh = ($dataHeight) ? 'data-height="'.$dataHeight.'"' : '';
        $fbst_pos = $module[0]['position'];
        if (!$locale) {
            $locale = 'en_US';
        }
        $class='';
        
        switch ($fbst_pos) {
            case "column_right":
                $css = 'position:fixed;right:-280px;top:20%;';
                break;
            case "column_left":
                $css = 'position:fixed;left:-280px;top:20%;';
                $class = 'left';
                break;
            case "content_top":
                $css = 'position:fixed;right:-280px;top:10px;';
                break;
            case "content_bottom":
                $css = 'position:fixed;right:-280px;bottom:0px;';
                break;
            default:
                $css = 'position:fixed;right:-280px;top:20%;';
        }
?>

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/<?php echo $locale; ?>/sdk.js#xfbml=1&version=v2.3";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div style="<?php echo $css; ?>" class="fbst-main <?php echo $class; ?>">
    <div class="fbst-image <?php echo $class; ?>"><img src="image/data/fb50x50.jpg"></div>
    <div style="float:left;" class="fb-page" data-href="https://www.facebook.com/<?php echo $fbst_code; ?>" data-hide-cover="<?php echo $hc; ?>" data-show-facepile="<?php echo $sf; ?>" data-show-posts="<?php echo $spp; ?>" <?php echo $dw; ?> <?php echo $dh; ?>></div>
<?php /*if ($fbst_pos == 'column_left') { ?>
    <div class="fbst-image <?php echo $class; ?>"><img src="image/data/fb50x50.jpg"></div>
    <div style="float:left;" class="fb-page" data-href="https://www.facebook.com/<?php echo $fbst_code; ?>" data-hide-cover="<?php echo $hc; ?>" data-show-facepile="<?php echo $sf; ?>" data-show-posts="<?php echo $spp; ?>" <?php echo $dw; ?> <?php echo $dh; ?>></div>
<?php } else { ?>
    <div style="float:right;" class="fb-page" data-href="https://www.facebook.com/<?php echo $fbst_code; ?>" data-hide-cover="<?php echo $hc; ?>" data-show-facepile="<?php echo $sf; ?>" data-show-posts="<?php echo $spp; ?>" <?php echo $dw; ?> <?php echo $dh; ?>></div>
    <div class="fbst-image"><img src="image/data/fb50x50.jpg"></div>
<?php }*/ ?>
</div>
