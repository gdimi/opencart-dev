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
class ControllerModuleFbst extends Controller {
	protected function index() {
		$this->language->load('module/fbst');

        $this->document->addStyle('catalog/view/theme/default/stylesheet/fbst.css');

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['fbst_code'] = str_replace('http', 'https', html_entity_decode($this->config->get('fbst_code')));
		} else {
			$this->data['fbst_code'] = html_entity_decode($this->config->get('fbst_code'));
		}
        
        $this->data['hideCover'] = $this->config->get('hide_cover');
        $this->data['showFaces'] = $this->config->get('show_faces');
        $this->data['showPagePosts'] = $this->config->get('show_page_posts');
        $this->data['dataWidth'] = $this->config->get('data_width');
        $this->data['dataHeight'] = $this->config->get('data_height');
        $this->data['module'] = array();
        $this->data['module'] = $this->config->get('fbst_module');
        $this->data['locale'] = $this->config->get('locale');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/fbst.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/fbst.tpl';
		} else {
			$this->template = 'default/template/module/fbst.tpl';
		}
		
		$this->render();
	}
}
?>
