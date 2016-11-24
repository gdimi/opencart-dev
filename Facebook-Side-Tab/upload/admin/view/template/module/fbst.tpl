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
echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td> <?php echo $entry_status; ?> </td>
            <td><select name="fbst_module[0][status]">
                  <?php if ($module[0]['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
            </td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_code; ?></td>
            <td><input type="text" name="fbst_code" value="<?php echo $fbst_code; ?>">
              <?php if ($error_code) { ?>
              <span class="error"><?php echo $error_code; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $hide_cover;?></td>
            <td>
                <?php
                    $hc = ($hideCover == 'on') ? 'checked' : '';
                ?>
                <input type="checkbox" name="hide_cover" <?php echo $hc; ?>/> 
            &nbsp;<?php echo $hide_cover_msg; ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $show_faces;?></td>
            <td>
                <?php
                    $sf = ($showFaces == 'on') ? 'checked' : '';
                ?>
                <input type="checkbox" name="show_faces" <?php echo $sf; ?>/>
                &nbsp;<?php echo $show_faces_msg; ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $show_page_posts;?></td>
            <td>
                <?php
                    $spp = ($showPagePosts == 'on') ? 'checked' : '';
                ?>
                <input type="checkbox" name="show_page_posts" <?php echo $spp; ?>/>
                &nbsp;
            </td>
          </tr>
          <tr>
            <td><?php echo $data_width;?></td>
            <td>
                <input type="text" name="data_width" value="<?php echo $dataWidth; ?>" />
              <?php if ($error_data_width_small) { ?>
              <span class="error"><?php echo $error_data_width_small; ?></span>
              <?php } ?>
              <?php if ($error_data_width_big) { ?>
              <span class="error"><?php echo $error_data_width_big; ?></span>
              <?php } ?>
                &nbsp;<?php echo $data_width_msg; ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $data_height;?></td>
            <td>
                <input type="text" name="data_height" value="<?php echo $dataHeight; ?>" />
              <?php if ($error_data_height_small) { ?>
              <span class="error"><?php echo $error_data_height_small; ?></span>
              <?php } ?>
                &nbsp;<?php echo $data_height_msg; ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $locale_str; ?></td>
            <td><input type="text" name="locale" value="<?php echo $locale; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_position;?></td>
            <td>
                <select name="fbst_module[0][position]">
                  <?php if ($module[0]['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module[0]['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php /*if ($module[0]['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } */?>
                  <?php if ($module[0]['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select>            
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_layout; ?></td>
            <td><select name="fbst_module[0][layout_id]">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module[0]['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
            </td>
          </tr>
        </table>
        <input type="hidden" name="fbst_module[0][sort_order]" value="0">
      </form>
      <?php echo $text_module_instructions; ?>
    </div>
  </div>
  <?php echo $text_module; ?>
</div>

<?php echo $footer; ?>
