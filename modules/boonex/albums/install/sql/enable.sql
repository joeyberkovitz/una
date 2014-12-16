
-- SETTINGS

SET @iTypeOrder = (SELECT MAX(`order`) FROM `sys_options_types` WHERE `group` = 'modules');
INSERT INTO `sys_options_types`(`group`, `name`, `caption`, `icon`, `order`) VALUES 
('modules', 'bx_albums', '_bx_albums', 'bx_albums@modules/boonex/albums/|std-mi.png', IF(ISNULL(@iTypeOrder), 1, @iTypeOrder + 1));
SET @iTypeId = LAST_INSERT_ID();

INSERT INTO `sys_options_categories` (`type_id`, `name`, `caption`, `order`)
VALUES (@iTypeId, 'bx_albums', '_bx_albums', 1);
SET @iCategId = LAST_INSERT_ID();

INSERT INTO `sys_options` (`name`, `value`, `category_id`, `caption`, `type`, `check`, `check_error`, `extra`, `order`) VALUES
('bx_albums_summary_chars', '700', @iCategId, '_bx_albums_option_summary_chars', 'digit', '', '', '', 1),
('bx_albums_plain_summary_chars', '200', @iCategId, '_bx_albums_option_plain_summary_chars', 'digit', '', '', '', 2),
('bx_albums_per_page_browse', '12', @iCategId, '_bx_albums_option_per_page_browse', 'digit', '', '', '', 10),
('bx_albums_rss_num', '10', @iCategId, '_bx_albums_option_rss_num', 'digit', '', '', '', 20);

-- PAGE: create entry

INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_create_entry', '_bx_albums_page_title_sys_create_entry', '_bx_albums_page_title_create_entry', 'bx_albums', 5, 2147483647, 1, 'create-album', 'page.php?i=create-album', '', '', '', 0, 1, 0, 'BxAlbumsPageBrowse', 'modules/boonex/albums/classes/BxAlbumsPageBrowse.php');

INSERT INTO `sys_pages_blocks` (`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES
('bx_albums_create_entry', 1, 'bx_albums', '_bx_albums_page_block_title_create_entry', 11, 2147483647, 'service', 'a:2:{s:6:"module";s:9:"bx_albums";s:6:"method";s:13:"entity_create";}', 0, 1, 1);


-- PAGE: edit entry

INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_edit_entry', '_bx_albums_page_title_sys_edit_entry', '_bx_albums_page_title_edit_entry', 'bx_albums', 5, 2147483647, 1, 'edit-album', '', '', '', '', 0, 1, 0, 'BxAlbumsPageEntry', 'modules/boonex/albums/classes/BxAlbumsPageEntry.php');

INSERT INTO `sys_pages_blocks` (`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES
('bx_albums_edit_entry', 1, 'bx_albums', '_bx_albums_page_block_title_edit_entry', 11, 2147483647, 'service', 'a:2:{s:6:"module";s:9:"bx_albums";s:6:"method";s:11:"entity_edit";}', 0, 0, 0);


-- PAGE: delete entry

INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_delete_entry', '_bx_albums_page_title_sys_delete_entry', '_bx_albums_page_title_delete_entry', 'bx_albums', 5, 2147483647, 1, 'delete-album', '', '', '', '', 0, 1, 0, 'BxAlbumsPageEntry', 'modules/boonex/albums/classes/BxAlbumsPageEntry.php');

INSERT INTO `sys_pages_blocks` (`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES
('bx_albums_delete_entry', 1, 'bx_albums', '_bx_albums_page_block_title_delete_entry', 11, 2147483647, 'service', 'a:2:{s:6:"module";s:9:"bx_albums";s:6:"method";s:13:"entity_delete";}', 0, 0, 0);


-- PAGE: view entry

INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_view_entry', '_bx_albums_page_title_sys_view_entry', '_bx_albums_page_title_view_entry', 'bx_albums', 10, 2147483647, 1, 'view-album', '', '', '', '', 0, 1, 0, 'BxAlbumsPageEntry', 'modules/boonex/albums/classes/BxAlbumsPageEntry.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `active`, `order`) VALUES 
('bx_albums_view_entry', 4, 'bx_albums', '_bx_albums_page_block_title_entry_text', 13, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:17:\"entity_text_block\";}', 0, 0, 1, 0),
('bx_albums_view_entry', 4, 'bx_albums', '_bx_albums_page_block_title_entry_attachments', 13, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:18:\"entity_attachments\";}', 0, 0, 1, 1),
('bx_albums_view_entry', 4, 'bx_albums', '_bx_albums_page_block_title_entry_comments', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:15:\"entity_comments\";}', 0, 0, 1, 2),
('bx_albums_view_entry', 1, 'bx_albums', '_bx_albums_page_block_title_entry_actions', 3, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:14:\"entity_actions\";}', 0, 0, 1, 0),
('bx_albums_view_entry', 2, 'bx_albums', '_bx_albums_page_block_title_entry_author', 3, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:13:\"entity_author\";}', 0, 0, 1, 0),
('bx_albums_view_entry', 3, 'bx_albums', '_bx_albums_page_block_title_entry_social_sharing', 0, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:21:\"entity_social_sharing\";}', 0, 0, 1, 0);


-- PAGE: view entry comments

INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_view_entry_comments', '_bx_albums_page_title_sys_view_entry_comments', '_bx_albums_page_title_view_entry_comments', 'bx_albums', 5, 2147483647, 1, 'view-album-comments', '', '', '', '', 0, 1, 0, 'BxAlbumsPageEntry', 'modules/boonex/albums/classes/BxAlbumsPageEntry.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_albums_view_entry_comments', 1, 'bx_albums', '_bx_albums_page_block_title_entry_comments', 13, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:15:\"entity_comments\";}', 0, 0, 1);


-- PAGE: popular entries

INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_popular', '_bx_albums_page_title_sys_entries_popular', '_bx_albums_page_title_entries_popular', 'bx_albums', 5, 2147483647, 1, 'albums-popular', 'page.php?i=albums-popular', '', '', '', 0, 1, 0, 'BxAlbumsPageBrowse', 'modules/boonex/albums/classes/BxAlbumsPageBrowse.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_albums_popular', 1, 'bx_albums', '_bx_albums_page_block_title_popular_entries', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:14:\"browse_popular\";}', 0, 1, 1);


-- PAGE: entries of author

INSERT INTO `sys_objects_page`(`object`, `uri`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_author', 'albums-author', '_bx_albums_page_title_sys_entries_of_author', '_bx_albums_page_title_entries_of_author', 'bx_albums', 5, 2147483647, 1, '', '', '', '', 0, 1, 0, 'BxAlbumsPageAuthor', 'modules/boonex/albums/classes/BxAlbumsPageAuthor.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_albums_author', 1, 'bx_albums', '_bx_albums_page_block_title_entries_actions', 3, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:18:\"my_entries_actions\";}', 0, 0, 0),
('bx_albums_author', 1, 'bx_albums', '_bx_albums_page_block_title_entries_of_author', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:13:\"browse_author\";}', 0, 0, 1);

-- PAGE: module home

INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_home', '_bx_albums_page_title_sys_home', '_bx_albums_page_title_home', 'bx_albums', 5, 2147483647, 1, 'albums-home', 'page.php?i=albums-home', '', '', '', 0, 1, 0, 'BxAlbumsPageBrowse', 'modules/boonex/albums/classes/BxAlbumsPageBrowse.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_albums_home', 1, 'bx_albums', '_bx_albums_page_block_title_recent_entries', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:13:\"browse_public\";}', 0, 1, 0);

-- PAGE: module manage
INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_manage', '_bx_albums_page_title_sys_manage', '_bx_albums_page_title_manage', 'bx_albums', 5, 2147483647, 1, 'albums-manage', 'page.php?i=albums-manage', '', '', '', 0, 1, 0, 'BxAlbumsPageBrowse', 'modules/boonex/albums/classes/BxAlbumsPageBrowse.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_albums_manage', 1, 'bx_albums', '_bx_albums_page_block_title_manage', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:12:\"manage_tools\";}}', 0, 1, 0);

-- PAGE: module moderation
INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_moderation', '_bx_albums_page_title_sys_manage', '_bx_albums_page_title_manage', 'bx_albums', 5, 64, 1, 'albums-moderation', 'page.php?i=albums-moderation', '', '', '', 0, 1, 0, 'BxAlbumsPageBrowse', 'modules/boonex/albums/classes/BxAlbumsPageBrowse.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_albums_moderation', 1, 'bx_albums', '_bx_albums_page_block_title_manage', 11, 64, 'service', 'a:3:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:12:\"manage_tools\";s:6:\"params\";a:1:{i:0;s:10:\"moderation\";}}', 0, 1, 0);

-- PAGE: module administration
INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_administration', '_bx_albums_page_title_sys_manage', '_bx_albums_page_title_manage', 'bx_albums', 5, 128, 1, 'albums-administration', 'page.php?i=albums-administration', '', '', '', 0, 1, 0, 'BxAlbumsPageBrowse', 'modules/boonex/albums/classes/BxAlbumsPageBrowse.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_albums_administration', 1, 'bx_albums', '_bx_albums_page_block_title_manage', 11, 128, 'service', 'a:3:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:12:\"manage_tools\";s:6:\"params\";a:1:{i:0;s:14:\"administration\";}}', 0, 1, 0);

-- PAGE: add block to homepage

SET @iBlockOrder = (SELECT `order` FROM `sys_pages_blocks` WHERE `object` = 'sys_home' AND `cell_id` = 1 ORDER BY `order` DESC LIMIT 1);
INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('sys_home', 1, 'bx_albums', '_bx_albums_page_block_title_recent_entries', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:9:\"bx_albums\";s:6:\"method\";s:13:\"browse_public\";}', 1, 0, IFNULL(@iBlockOrder, 0) + 1);


-- MENU: add to site menu

SET @iSiteMenuOrder = (SELECT `order` FROM `sys_menu_items` WHERE `set_name` = 'sys_site' AND `active` = 1 ORDER BY `order` DESC LIMIT 1);
INSERT INTO `sys_menu_items` (`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('sys_site', 'bx_albums', 'albums-home', '_bx_albums_menu_item_title_system_entries_home', '_bx_albums_menu_item_title_entries_home', 'page.php?i=albums-home', '', '', 'camera col-blue1', 'bx_albums_submenu', 2147483647, 1, 1, IFNULL(@iSiteMenuOrder, 0) + 1);

-- MENU: add to "add content" menu

SET @iAddMenuOrder = (SELECT `order` FROM `sys_menu_items` WHERE `set_name` = 'sys_add_content_links' AND `active` = 1 ORDER BY `order` DESC LIMIT 1);
INSERT INTO `sys_menu_items` (`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('sys_add_content_links', 'bx_albums', 'create-album', '_bx_albums_menu_item_title_system_create_entry', '_bx_albums_menu_item_title_create_entry', 'page.php?i=create-album', '', '', 'camera col-blue1', '', 2147483647, 1, 1, IFNULL(@iAddMenuOrder, 0) + 1);


-- MENU: actions menu for view entry 

INSERT INTO `sys_objects_menu`(`object`, `title`, `set_name`, `module`, `template_id`, `deletable`, `active`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_view', '_bx_albums_menu_title_view_entry', 'bx_albums_view', 'bx_albums', 9, 0, 1, 'BxAlbumsMenuView', 'modules/boonex/albums/classes/BxAlbumsMenuView.php');

INSERT INTO `sys_menu_sets`(`set_name`, `module`, `title`, `deletable`) VALUES 
('bx_albums_view', 'bx_albums', '_bx_albums_menu_set_title_view_entry', 0);

INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('bx_albums_view', 'bx_albums', 'edit-album', '_bx_albums_menu_item_title_system_edit_entry', '_bx_albums_menu_item_title_edit_entry', 'page.php?i=edit-album&id={content_id}', '', '', 'pencil', '', 2147483647, 1, 0, 1),
('bx_albums_view', 'bx_albums', 'delete-album', '_bx_albums_menu_item_title_system_delete_entry', '_bx_albums_menu_item_title_delete_entry', 'page.php?i=delete-album&id={content_id}', '', '', 'remove', '', 2147483647, 1, 0, 2);


-- MENU: actions menu for my entries

INSERT INTO `sys_objects_menu`(`object`, `title`, `set_name`, `module`, `template_id`, `deletable`, `active`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_my', '_bx_albums_menu_title_entries_my', 'bx_albums_my', 'bx_albums', 9, 0, 1, 'BxAlbumsMenu', 'modules/boonex/albums/classes/BxAlbumsMenu.php');

INSERT INTO `sys_menu_sets`(`set_name`, `module`, `title`, `deletable`) VALUES 
('bx_albums_my', 'bx_albums', '_bx_albums_menu_set_title_entries_my', 0);

INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('bx_albums_my', 'bx_albums', 'create-album', '_bx_albums_menu_item_title_system_create_entry', '_bx_albums_menu_item_title_create_entry', 'page.php?i=create-album', '', '', 'plus', '', 2147483647, 1, 0, 0);


-- MENU: module sub-menu

INSERT INTO `sys_objects_menu`(`object`, `title`, `set_name`, `module`, `template_id`, `deletable`, `active`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_submenu', '_bx_albums_menu_title_submenu', 'bx_albums_submenu', 'bx_albums', 8, 0, 1, '', '');

INSERT INTO `sys_menu_sets`(`set_name`, `module`, `title`, `deletable`) VALUES 
('bx_albums_submenu', 'bx_albums', '_bx_albums_menu_set_title_submenu', 0);

INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('bx_albums_submenu', 'bx_albums', 'albums-home', '_bx_albums_menu_item_title_system_entries_public', '_bx_albums_menu_item_title_entries_public', 'page.php?i=albums-home', '', '', '', '', 2147483647, 1, 1, 1),
('bx_albums_submenu', 'bx_albums', 'albums-popular', '_bx_albums_menu_item_title_system_entries_popular', '_bx_albums_menu_item_title_entries_popular', 'page.php?i=albums-popular', '', '', '', '', 2147483647, 1, 1, 2),
('bx_albums_submenu', 'bx_albums', 'albums-manage', '_bx_albums_menu_item_title_system_entries_manage', '_bx_albums_menu_item_title_entries_manage', 'page.php?i=albums-manage', '', '', '', '', 2147483646, 1, 1, 3);

-- MENU: sub-menu for view entry

INSERT INTO `sys_objects_menu`(`object`, `title`, `set_name`, `module`, `template_id`, `deletable`, `active`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_view_submenu', '_bx_albums_menu_title_view_entry_submenu', 'bx_albums_view_submenu', 'bx_albums', 8, 0, 1, 'BxAlbumsMenuView', 'modules/boonex/albums/classes/BxAlbumsMenuView.php');

INSERT INTO `sys_menu_sets`(`set_name`, `module`, `title`, `deletable`) VALUES 
('bx_albums_view_submenu', 'bx_albums', '_bx_albums_menu_set_title_view_entry_submenu', 0);

INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('bx_albums_view_submenu', 'bx_albums', 'view-album', '_bx_albums_menu_item_title_system_view_entry', '_bx_albums_menu_item_title_view_entry_submenu_entry', 'page.php?i=view-album&id={content_id}', '', '', '', '', 2147483647, 1, 0, 1),
('bx_albums_view_submenu', 'bx_albums', 'view-album-comments', '_bx_albums_menu_item_title_system_view_entry_comments', '_bx_albums_menu_item_title_view_entry_submenu_comments', 'page.php?i=view-album-comments&id={content_id}', '', '', '', '', 2147483647, 1, 0, 2);

-- MENU: profile stats
SET @iNotifMenuOrder = (SELECT IFNULL(MAX(`order`), 0) FROM `sys_menu_items` WHERE `set_name` = 'sys_profile_stats' AND `active` = 1 LIMIT 1);
INSERT INTO `sys_menu_items` (`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `addon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES
('sys_profile_stats', 'bx_albums', 'profile-stats-manage-albums', '_bx_albums_menu_item_title_system_manage_my_albums', '_bx_albums_menu_item_title_manage_my_albums', 'page.php?i=albums-manage', '', '_self', 'camera col-blue1', 'a:2:{s:6:"module";s:9:"bx_albums";s:6:"method";s:41:"get_menu_addon_manage_tools_profile_stats";}', '', 2147483646, 1, 0, @iNotifMenuOrder + 1);

-- MENU: manage tools submenu
INSERT INTO `sys_objects_menu`(`object`, `title`, `set_name`, `module`, `template_id`, `deletable`, `active`, `override_class_name`, `override_class_file`) VALUES 
('bx_albums_menu_manage_tools', '_bx_albums_menu_title_manage_tools', 'bx_albums_menu_manage_tools', 'bx_albums', 6, 0, 1, 'BxAlbumsMenuManageTools', 'modules/boonex/albums/classes/BxAlbumsMenuManageTools.php');

INSERT INTO `sys_menu_sets`(`set_name`, `module`, `title`, `deletable`) VALUES 
('bx_albums_menu_manage_tools', 'bx_albums', '_bx_albums_menu_set_title_manage_tools', 0);

--INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
--('bx_albums_menu_manage_tools', 'bx_albums', 'delete-with-content', '_bx_albums_menu_item_title_system_delete_with_content', '_bx_albums_menu_item_title_delete_with_content', 'javascript:void(0)', 'javascript:{js_object}.onClickDeleteWithContent({content_id});', '_self', 'trash-o', '', 128, 1, 0, 0);

-- MENU: dashboard manage tools
SET @iManageMenuOrder = (SELECT IFNULL(MAX(`order`), 0) FROM `sys_menu_items` WHERE `set_name`='sys_account_dashboard_manage_tools' LIMIT 1);
INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `addon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('sys_account_dashboard_manage_tools', 'bx_albums', 'albums-moderation', '_bx_albums_menu_item_title_system_admt_albums', '_bx_albums_menu_item_title_admt_albums', 'page.php?i=albums-moderation', '', '_self', '', 'a:2:{s:6:"module";s:9:"bx_albums";s:6:"method";s:27:"get_menu_addon_manage_tools";}', '', 64, 1, 0, @iManageMenuOrder + 1),
('sys_account_dashboard_manage_tools', 'bx_albums', 'albums-administration', '_bx_albums_menu_item_title_system_admt_albums', '_bx_albums_menu_item_title_admt_albums', 'page.php?i=albums-administration', '', '_self', '', 'a:2:{s:6:"module";s:9:"bx_albums";s:6:"method";s:27:"get_menu_addon_manage_tools";}', '', 128, 1, 0, @iManageMenuOrder + 2);

-- MENU: add menu item to profiles modules (trigger* menu sets are processed separately upon modules enable/disable)

INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('trigger_profile_view_submenu', 'bx_albums', 'albums-author', '_bx_albums_menu_item_title_system_view_entries_author', '_bx_albums_menu_item_title_view_entries_author', 'page.php?i=albums-author&profile_id={profile_id}', '', '', '', '', 2147483647, 1, 0, 0);


-- PRIVACY 

INSERT INTO `sys_objects_privacy` (`object`, `module`, `action`, `title`, `default_group`, `table`, `table_field_id`, `table_field_author`, `override_class_name`, `override_class_file`) VALUES
('bx_albums_allow_view_to', 'bx_albums', 'view', '_bx_albums_form_entry_input_allow_view_to', '3', 'bx_albums_albums', 'id', 'author', '', '');


-- ACL

INSERT INTO `sys_acl_actions` (`Module`, `Name`, `AdditionalParamName`, `Title`, `Desc`, `Countable`, `DisabledForLevels`) VALUES
('bx_albums', 'create entry', NULL, '_bx_albums_acl_action_create_entry', '', 1, 3);
SET @iIdActionEntryCreate = LAST_INSERT_ID();

INSERT INTO `sys_acl_actions` (`Module`, `Name`, `AdditionalParamName`, `Title`, `Desc`, `Countable`, `DisabledForLevels`) VALUES
('bx_albums', 'delete entry', NULL, '_bx_albums_acl_action_delete_entry', '', 1, 3);
SET @iIdActionEntryDelete = LAST_INSERT_ID();

INSERT INTO `sys_acl_actions` (`Module`, `Name`, `AdditionalParamName`, `Title`, `Desc`, `Countable`, `DisabledForLevels`) VALUES
('bx_albums', 'view entry', NULL, '_bx_albums_acl_action_view_entry', '', 1, 0);
SET @iIdActionEntryView = LAST_INSERT_ID();

INSERT INTO `sys_acl_actions` (`Module`, `Name`, `AdditionalParamName`, `Title`, `Desc`, `Countable`, `DisabledForLevels`) VALUES
('bx_albums', 'set thumb', NULL, '_bx_albums_acl_action_set_thumb', '', 1, 3);
SET @iIdActionSetThumb = LAST_INSERT_ID();

INSERT INTO `sys_acl_actions` (`Module`, `Name`, `AdditionalParamName`, `Title`, `Desc`, `Countable`, `DisabledForLevels`) VALUES
('bx_albums', 'edit any entry', NULL, '_bx_albums_acl_action_edit_any_entry', '', 1, 3);
SET @iIdActionEntryEditAny = LAST_INSERT_ID();

SET @iUnauthenticated = 1;
SET @iAccount = 2;
SET @iStandard = 3;
SET @iUnconfirmed = 4;
SET @iPending = 5;
SET @iSuspended = 6;
SET @iModerator = 7;
SET @iAdministrator = 8;
SET @iPremium = 9;

INSERT INTO `sys_acl_matrix` (`IDLevel`, `IDAction`) VALUES

-- entry create
(@iStandard, @iIdActionEntryCreate),
(@iModerator, @iIdActionEntryCreate),
(@iAdministrator, @iIdActionEntryCreate),
(@iPremium, @iIdActionEntryCreate),

-- entry delete
(@iStandard, @iIdActionEntryDelete),
(@iModerator, @iIdActionEntryDelete),
(@iAdministrator, @iIdActionEntryDelete),
(@iPremium, @iIdActionEntryDelete),

-- entry view
(@iUnauthenticated, @iIdActionEntryView),
(@iAccount, @iIdActionEntryView),
(@iStandard, @iIdActionEntryView),
(@iUnconfirmed, @iIdActionEntryView),
(@iPending, @iIdActionEntryView),
(@iModerator, @iIdActionEntryView),
(@iAdministrator, @iIdActionEntryView),
(@iPremium, @iIdActionEntryView),

-- set entry thumb
(@iStandard, @iIdActionSetThumb),
(@iModerator, @iIdActionSetThumb),
(@iAdministrator, @iIdActionSetThumb),
(@iPremium, @iIdActionSetThumb),

-- edit any entry
(@iModerator, @iIdActionEntryEditAny),
(@iAdministrator, @iIdActionEntryEditAny);


-- SEARCH
INSERT INTO `sys_objects_search` (`ObjectName`, `Title`, `ClassName`, `ClassPath`) VALUES
('bx_albums', '_bx_albums', 'BxAlbumsSearchResult', 'modules/boonex/albums/classes/BxAlbumsSearchResult.php'),
('bx_albums_cmts', '_bx_albums_cmts', 'BxAlbumsCmtsSearchResult', 'modules/boonex/albums/classes/BxAlbumsCmtsSearchResult.php');

-- METATAGS
INSERT INTO `sys_objects_metatags` (`object`, `table_keywords`, `table_locations`, `table_mentions`, `override_class_name`, `override_class_file`) VALUES
('bx_albums', 'bx_albums_meta_keywords', 'bx_albums_meta_locations', '', '', '');

-- GRIDS: moderation tools
INSERT INTO `sys_objects_grid` (`object`, `source_type`, `source`, `table`, `field_id`, `field_order`, `field_active`, `paginate_url`, `paginate_per_page`, `paginate_simple`, `paginate_get_start`, `paginate_get_per_page`, `filter_fields`, `filter_fields_translatable`, `filter_mode`, `sorting_fields`, `sorting_fields_translatable`, `override_class_name`, `override_class_file`) VALUES
('bx_albums_administration', 'Sql', 'SELECT * FROM `bx_albums_albums` WHERE 1 ', 'bx_albums_albums', 'id', '', 'status', '', 20, NULL, 'start', '', 'title,text', '', 'like', '', '', 'BxAlbumsGridAdministration', 'modules/boonex/albums/classes/BxAlbumsGridAdministration.php'),
('bx_albums_moderation', 'Sql', 'SELECT * FROM `bx_albums_albums` WHERE 1 ', 'bx_albums_albums', 'id', '', 'status', '', 20, NULL, 'start', '', 'title,text', '', 'like', '', '', 'BxAlbumsGridModeration', 'modules/boonex/albums/classes/BxAlbumsGridModeration.php'),
('bx_albums_common', 'Sql', 'SELECT * FROM `bx_albums_albums` WHERE 1 ', 'bx_albums_albums', 'id', '', 'status', '', 20, NULL, 'start', '', 'title,text', '', 'like', '', '', 'BxAlbumsGridCommon', 'modules/boonex/albums/classes/BxAlbumsGridCommon.php');


INSERT INTO `sys_grid_fields` (`object`, `name`, `title`, `width`, `translatable`, `chars_limit`, `params`, `order`) VALUES
('bx_albums_administration', 'checkbox', '_sys_select', '2%', 0, '', '', 1),
('bx_albums_administration', 'switcher', '_bx_albums_grid_column_title_adm_active', '8%', 0, '', '', 2),
('bx_albums_administration', 'title', '_bx_albums_grid_column_title_adm_title', '25%', 0, '', '', 3),
('bx_albums_administration', 'added', '_bx_albums_grid_column_title_adm_added', '20%', 1, '25', '', 4),
('bx_albums_administration', 'author', '_bx_albums_grid_column_title_adm_author', '25%', 0, '25', '', 5),
('bx_albums_administration', 'actions', '', '20%', 0, '', '', 6),
('bx_albums_moderation', 'switcher', '', '10%', 0, '', '', 1),
('bx_albums_moderation', 'title', '_bx_albums_grid_column_title_adm_title', '25%', 0, '', '', 2),
('bx_albums_moderation', 'added', '_bx_albums_grid_column_title_adm_added', '25%', 1, '25', '', 3),
('bx_albums_moderation', 'author', '_bx_albums_grid_column_title_adm_author', '25%', 0, '25', '', 4),
('bx_albums_moderation', 'actions', '', '15%', 0, '', '', 5),
('bx_albums_common', 'checkbox', '_sys_select', '2%', 0, '', '', 1),
('bx_albums_common', 'switcher', '', '8%', 0, '', '', 2),
('bx_albums_common', 'title', '_bx_albums_grid_column_title_adm_title', '40%', 0, '', '', 3),
('bx_albums_common', 'added', '_bx_albums_grid_column_title_adm_added', '30%', 1, '25', '', 4),
('bx_albums_common', 'actions', '', '20%', 0, '', '', 5);

INSERT INTO `sys_grid_actions` (`object`, `type`, `name`, `title`, `icon`, `icon_only`, `confirm`, `order`) VALUES
('bx_albums_administration', 'bulk', 'delete', '_bx_albums_grid_action_title_adm_delete', '', 0, 1, 2),
('bx_albums_administration', 'single', 'edit', '_bx_albums_grid_action_title_adm_edit', 'pencil', 1, 0, 1),
('bx_albums_administration', 'single', 'delete', '_bx_albums_grid_action_title_adm_delete', 'remove', 1, 1, 2),
('bx_albums_administration', 'single', 'settings', '_bx_albums_grid_action_title_adm_more_actions', 'cog', 1, 0, 3),
('bx_albums_moderation', 'single', 'edit', '_bx_albums_grid_action_title_adm_edit', 'pencil', 1, 0, 1),
('bx_albums_moderation', 'single', 'settings', '_bx_albums_grid_action_title_adm_more_actions', 'cog', 1, 0, 2),
('bx_albums_common', 'bulk', 'delete', '_bx_albums_grid_action_title_adm_delete', '', 0, 1, 2),
('bx_albums_common', 'single', 'edit', '_bx_albums_grid_action_title_adm_edit', 'pencil', 1, 0, 1),
('bx_albums_common', 'single', 'delete', '_bx_albums_grid_action_title_adm_delete', 'remove', 1, 1, 2),
('bx_albums_common', 'single', 'settings', '_bx_albums_grid_action_title_adm_more_actions', 'cog', 1, 0, 3);
