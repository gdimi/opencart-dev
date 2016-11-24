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
	private $error = array(); 

	public function index() {   
		$this->language->load('module/fbst');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('fbst', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_module'] = $this->language->get('text_module');
		$this->data['text_module_instructions'] = $this->language->get('text_module_instructions');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');

		$this->data['entry_code'] = $this->language->get('entry_code');
		$this->data['hide_cover'] = $this->language->get('hide_cover');
		$this->data['hide_cover_msg'] = $this->language->get('hide_cover_msg');
		$this->data['show_faces'] = $this->language->get('show_faces');
		$this->data['show_faces_msg'] = $this->language->get('show_faces_msg');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['show_page_posts'] = $this->language->get('show_page_posts');
		$this->data['data_width'] = $this->language->get('data_width');
		$this->data['data_width_msg'] = $this->language->get('data_width_msg');
		$this->data['data_height'] = $this->language->get('data_height');
		$this->data['data_height_msg'] = $this->language->get('data_height_msg');
		$this->data['locale_str'] = $this->language->get('locale_str');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		if (isset($this->error['code'])) {
			$this->data['error_code'] = $this->error['code'];
		} else {
			$this->data['error_code'] = '';
		}
		if (isset($this->error['error_data_width_small'])) {
			$this->data['error_data_width_small'] = $this->error['error_data_width_small'];
		} else {
			$this->data['error_data_width_small'] = '';
		}
		if (isset($this->error['error_data_width_big'])) {
			$this->data['error_data_width_big'] = $this->error['error_data_width_big'];
		} else {
			$this->data['error_data_width_big'] = '';
		}
		if (isset($this->error['error_data_height_small'])) {
			$this->data['error_data_height_small'] = $this->error['error_data_height_small'];
		} else {
			$this->data['error_data_height_small'] = '';
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/fbst', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['action'] = $this->url->link('module/fbst', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['fbst_code'])) {
			$this->data['fbst_code'] = $this->request->post['fbst_code'];
		} else {
			$this->data['fbst_code'] = $this->config->get('fbst_code');
		}
		if (isset($this->request->post['show_faces'])) {
			$this->data['showFaces'] = $this->request->post['show_faces'];
		} else {
			$this->data['showFaces'] = $this->config->get('show_faces');
		}
		if (isset($this->request->post['hide_cover'])) {
			$this->data['hideCover'] = $this->request->post['hide_cover'];
		} else {
			$this->data['hideCover'] = $this->config->get('hide_cover');
		}
		if (isset($this->request->post['show_page_posts'])) {
			$this->data['showPagePosts'] = $this->request->post['show_page_posts'];
		} else {
			$this->data['showPagePosts'] = $this->config->get('show_page_posts');
		}
		if (isset($this->request->post['data_width'])) {
			$this->data['dataWidth'] = $this->request->post['data_width'];
		} else {
			$this->data['dataWidth'] = $this->config->get('data_width');
		}
		if (isset($this->request->post['data_height'])) {
			$this->data['dataHeight'] = $this->request->post['data_height'];
		} else {
			$this->data['dataHeight'] = $this->config->get('data_height');
		}
		if (isset($this->request->post['locale_str'])) {
			$this->data['locale'] = $this->request->post['locale'];
		} else {
			$this->data['locale'] = $this->config->get('locale');
		}

        $this->data['module'] = array();
        
		if (isset($this->request->post['fbst_module'])) {
			$this->data['module'] = $this->request->post['fbst_module'];
		} elseif ($this->config->get('fbst_module')) { 
			$this->data['module'] = $this->config->get('fbst_module');
		}			

		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/fbst.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/fbst')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['fbst_code']) {
			$this->error['code'] = $this->language->get('error_code');
		}

        if ($this->request->post['data_width']) {
            $dw = $this->request->post['data_width'];
            if ($dw < 280) {
                $this->error['error_data_width_small'] = $this->language->get('error_data_width_small');
            }
            if ($dw > 500) {
                $this->error['error_data_width_big'] = $this->language->get('error_data_width_big');
            }
        }
        
        if ($this->request->post['data_height'] && $this->request->post['data_height'] < 130) {
            $this->error['error_data_height_small'] = $this->language->get('error_data_height_small');
        }

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>
