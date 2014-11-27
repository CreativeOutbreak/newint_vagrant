# Converted with pg2mysql-1.9
# Converted on Wed, 26 Nov 2014 12:39:14 +0000
# Lightbox Technologies Inc. http://www.lightbox.ca

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone="+00:00";

CREATE TABLE `action` (
    id int(11) auto_increment NOT NULL,
    ord smallint NOT NULL,
    server_type__id int(11) NOT NULL,
    action_type__id int(11) NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE action_type (
    id int(11) auto_increment NOT NULL,
    name varchar(64) NOT NULL,
    description text,
    active bool DEFAULT 0 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE action_type__media_type (
    action_type__id int(11) NOT NULL,
    media_type__id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE addr (
    id int(11) auto_increment NOT NULL,
    org__id int(11) NOT NULL,
    `type` varchar(64),
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE addr_part (
    id int(11) auto_increment NOT NULL,
    addr__id int(11) NOT NULL,
    addr_part_type__id int(11) NOT NULL,
    value text NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE addr_part_type (
    id int(11) auto_increment NOT NULL,
    name varchar(64) NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE alert (
    id int(11) auto_increment NOT NULL,
    alert_type__id int(11) NOT NULL,
    event__id int(11) NOT NULL,
    subject varchar(128),
    message text,
    `timestamp` timestamp DEFAULT ('now'
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE alert_type (
    id int(11) auto_increment NOT NULL,
    event_type__id int(11) NOT NULL,
    usr__id int(11) NOT NULL,
    name varchar(64) NOT NULL,
    subject varchar(128),
    message text,
    active bool DEFAULT 1 NOT NULL,
    del bool DEFAULT 0 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE alert_type__grp__contact (
    alert_type__id int(11) NOT NULL,
    contact__id int(11) NOT NULL,
    grp__id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE alert_type__usr__contact (
    alert_type__id int(11) NOT NULL,
    contact__id int(11) NOT NULL,
    usr__id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE alert_type_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE alert_type_rule (
    id int(11) auto_increment NOT NULL,
    alert_type__id int(11) NOT NULL,
    attr varchar(64) NOT NULL,
    `operator` varchar(2) NOT NULL,
    value text NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE alerted (
    id int(11) auto_increment NOT NULL,
    usr__id int(11) NOT NULL,
    alert__id int(11) NOT NULL,
    ack_time timestamp
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE alerted__contact_value (
    alerted__id int(11) NOT NULL,
    contact__id int(11) NOT NULL,
    contact_value__value text NOT NULL,
    sent_time timestamp
) TYPE=MyISAM;

CREATE TABLE at_type (
    id int(11) auto_increment NOT NULL,
    name varchar(64) NOT NULL,
    description text,
    top_level bool DEFAULT 0 NOT NULL,
    paginated bool DEFAULT 0 NOT NULL,
    fixed_url bool DEFAULT 0 NOT NULL,
    related_story bool DEFAULT 0 NOT NULL,
    related_media bool DEFAULT 0 NOT NULL,
    media bool DEFAULT 0 NOT NULL,
    biz_class__id int(11) NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE at_type_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_action (
    id int(11) auto_increment NOT NULL,
    subsys text NOT NULL,
    name text NOT NULL,
    sql_type varchar(30) NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_action_meta (
    id int(11) auto_increment NOT NULL,
    attr__id int(11) NOT NULL,
    name text NOT NULL,
    value text,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_action_val (
    id int(11) auto_increment NOT NULL,
    object__id int(11) NOT NULL,
    attr__id int(11) NOT NULL,
    date_val timestamp,
    short_val text,
    blob_val text,
    int(11) auto_increment bool DEFAULT 0,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
, PRIMARY KEY(`int(11)`)
) TYPE=MyISAM;

CREATE TABLE attr_category (
    id int(11) auto_increment NOT NULL,
    subsys text NOT NULL,
    name text NOT NULL,
    sql_type varchar(30) NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_category_meta (
    id int(11) auto_increment NOT NULL,
    attr__id int(11) NOT NULL,
    name text NOT NULL,
    value text,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_category_val (
    id int(11) auto_increment NOT NULL,
    object__id int(11) NOT NULL,
    attr__id int(11) NOT NULL,
    date_val timestamp,
    short_val text,
    blob_val text,
    int(11) auto_increment bool DEFAULT 0,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
, PRIMARY KEY(`int(11)`)
) TYPE=MyISAM;

CREATE TABLE attr_element_type (
    id int(11) auto_increment NOT NULL,
    subsys text NOT NULL,
    name text NOT NULL,
    sql_type varchar(30) NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_element_type_meta (
    id int(11) auto_increment NOT NULL,
    attr__id int(11) NOT NULL,
    name text NOT NULL,
    value text,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_element_type_val (
    id int(11) auto_increment NOT NULL,
    object__id int(11) NOT NULL,
    attr__id int(11) NOT NULL,
    date_val timestamp,
    short_val text,
    blob_val text,
    int(11) auto_increment bool DEFAULT 0,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
, PRIMARY KEY(`int(11)`)
) TYPE=MyISAM;

CREATE TABLE attr_field_type (
    id int(11) auto_increment NOT NULL,
    subsys text NOT NULL,
    name text NOT NULL,
    sql_type varchar(30) NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_field_type_meta (
    id int(11) auto_increment NOT NULL,
    attr__id int(11) NOT NULL,
    name text NOT NULL,
    value text,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_field_type_val (
    id int(11) auto_increment NOT NULL,
    object__id int(11) NOT NULL,
    attr__id int(11) NOT NULL,
    date_val timestamp,
    short_val text,
    blob_val text,
    int(11) auto_increment bool DEFAULT 0,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
, PRIMARY KEY(`int(11)`)
) TYPE=MyISAM;

CREATE TABLE attr_grp (
    id int(11) auto_increment NOT NULL,
    subsys text NOT NULL,
    name text NOT NULL,
    sql_type varchar(30) NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_grp_meta (
    id int(11) auto_increment NOT NULL,
    attr__id int(11) NOT NULL,
    name text NOT NULL,
    value text,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE attr_grp_val (
    id int(11) auto_increment NOT NULL,
    object__id int(11) NOT NULL,
    attr__id int(11) NOT NULL,
    date_val timestamp,
    short_val text,
    blob_val text,
    int(11) auto_increment bool DEFAULT 0,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
, PRIMARY KEY(`int(11)`)
) TYPE=MyISAM;

CREATE TABLE attr_member (
    id int(11) NOT NULL,
    subsys text NOT NULL,
    name text NOT NULL,
    sql_type varchar(30) NOT NULL,
    active bool DEFAULT 1 NOT NULL
) TYPE=MyISAM;

CREATE TABLE attr_member_meta (
    id int(11) NOT NULL,
    attr__id int(11) NOT NULL,
    name text NOT NULL,
    value text,
    active bool DEFAULT 1 NOT NULL
) TYPE=MyISAM;

CREATE TABLE attr_member_val (
    id int(11) NOT NULL,
    object__id int(11) NOT NULL,
    attr__id int(11) NOT NULL,
    date_val timestamp,
    short_val text,
    blob_val text,
    int(11) auto_increment bool DEFAULT 0,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`int(11)`)
) TYPE=MyISAM;

CREATE TABLE category (
    id int(11) auto_increment NOT NULL,
    site__id int(11) NOT NULL,
    directory varchar(128) NOT NULL,
    uri text NOT NULL,
    description text,
    parent_id int(11) NOT NULL,
    asset_grp_id int(11) NOT NULL,
    active bool DEFAULT 1 NOT NULL,
    name varchar(128)
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE category_keyword (
    category_id int(11) NOT NULL,
    keyword_id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE category_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE `class` (
    id int(11) auto_increment NOT NULL,
    key_name varchar(32) NOT NULL,
    pkg_name varchar(128) NOT NULL,
    disp_name varchar(128) NOT NULL,
    plural_name varchar(128) NOT NULL,
    description text,
    distributor bool DEFAULT 0 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE contact (
    id int(11) auto_increment NOT NULL,
    `type` varchar(64) NOT NULL,
    description text,
    active bool DEFAULT 1 NOT NULL,
    alertable bool DEFAULT 0 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE contact_value (
    id int(11) auto_increment NOT NULL,
    contact__id int(11) NOT NULL,
    value text NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE contrib_type_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE desk (
    id int(11) auto_increment NOT NULL,
    name varchar(64) NOT NULL,
    description text,
    pre_chk_rules int(11),
    post_chk_rules int(11),
    asset_grp int(11),
    publish bool DEFAULT 0 NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE desk_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE dest_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE element_type (
    id int(11) auto_increment NOT NULL,
    name varchar(64) NOT NULL,
    key_name varchar(64) NOT NULL,
    description text,
    type__id int(11),
    et_grp__id int(11),
    active bool DEFAULT 1 NOT NULL,
    top_level bool NOT NULL,
    paginated bool NOT NULL,
    fixed_uri bool NOT NULL,
    related_story bool NOT NULL,
    related_media bool NOT NULL,
    media bool NOT NULL,
    biz_class__id int(11) NOT NULL,
    displayed bool DEFAULT 0 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE element_type__output_channel (
    id int(11) auto_increment NOT NULL,
    element_type__id int(11) NOT NULL,
    output_channel__id int(11) NOT NULL,
    enabled bool DEFAULT 1 NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE element_type__site (
    id int(11) auto_increment NOT NULL,
    element_type__id int(11) NOT NULL,
    site__id int(11) NOT NULL,
    active bool DEFAULT 1 NOT NULL,
    primary_oc__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE element_type_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE event (
    id int(11) auto_increment NOT NULL,
    event_type__id int(11) NOT NULL,
    usr__id int(11) NOT NULL,
    obj_id int(11) NOT NULL,
    `timestamp` timestamp DEFAULT (timeofday())
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE event_attr (
    id int(11) auto_increment NOT NULL,
    event__id int(11) NOT NULL,
    event_type_attr__id int(11) NOT NULL,
    value varchar(128)
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE event_type (
    id int(11) auto_increment NOT NULL,
    key_name varchar(64) NOT NULL,
    name varchar(64) NOT NULL,
    description text NOT NULL,
    class__id int(11) NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE event_type_attr (
    id int(11) auto_increment NOT NULL,
    event_type__id int(11) NOT NULL,
    name varchar(64) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE field_type (
    id int(11) auto_increment NOT NULL,
    element_type__id int(11) NOT NULL,
    description text,
    place int(11) NOT NULL,
    autopopulated bool DEFAULT 0 NOT NULL,
    active bool DEFAULT 1 NOT NULL,
    max_length int(11),
    sql_type varchar(30),
    name text NOT NULL,
    widget_type varchar(30) DEFAULT 'text',
    `precision` smallint,
    cols int(11) NOT NULL,
    `rows` int(11) NOT NULL,
    length int(11) NOT NULL,
    vals text,
    multiple bool DEFAULT 0 NOT NULL,
    default_val text,
    key_name text NOT NULL,
    max_occurrence int(11) DEFAULT 0 NOT NULL,
    min_occurrence int(11) DEFAULT 0 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE grp (
    id int(11) auto_increment NOT NULL,
    parent_id int(11),
    class__id int(11) NOT NULL,
    name varchar(64),
    description text,
    secret bool DEFAULT 1 NOT NULL,
    permanent bool DEFAULT 0 NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE grp_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE grp_priv (
    id int(11) auto_increment NOT NULL,
    grp__id int(11) NOT NULL,
    value smallint NOT NULL,
    mtime timestamp DEFAULT ('now'
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE grp_priv__grp_member (
    grp_priv__id int(11) NOT NULL,
    grp__id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE job (
    id int(11) auto_increment NOT NULL,
    name text NOT NULL,
    usr__id int(11) NOT NULL,
    sched_time timestamp DEFAULT ('now',
    priority smallint DEFAULT 3 NOT NULL,
    comp_time timestamp,
    expire bool DEFAULT 0 NOT NULL,
    failed bool DEFAULT 0 NOT NULL,
    tries smallint DEFAULT 0 NOT NULL,
    executing bool DEFAULT 0 NOT NULL,
    class__id int(11) NOT NULL,
    story_instance__id int(11),
    media_instance__id int(11),
    error_message text
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE job__resource (
    job__id int(11) NOT NULL,
    resource__id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE job__server_type (
    job__id int(11) NOT NULL,
    server_type__id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE job_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE keyword (
    id int(11) auto_increment NOT NULL,
    name text NOT NULL,
    screen_name text NOT NULL,
    sort_name text NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE keyword_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media (
    id int(11) auto_increment NOT NULL,
    element_type__id int(11) NOT NULL,
    priority smallint DEFAULT 3 NOT NULL,
    source__id int(11) NOT NULL,
    current_version int(11),
    published_version int(11),
    usr__id int(11),
    first_publish_date timestamp,
    publish_date timestamp,
    expire_date timestamp,
    workflow__id int(11) NOT NULL,
    desk__id int(11) NOT NULL,
    publish_status bool DEFAULT 0 NOT NULL,
    active bool DEFAULT 1 NOT NULL,
    site__id int(11) NOT NULL,
    alias_id int(11),
    uuid text NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media__contributor (
    id int(11) auto_increment NOT NULL,
    media_instance__id int(11) NOT NULL,
    member__id int(11) NOT NULL,
    place smallint NOT NULL,
    `role` text
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media__output_channel (
    media_instance__id int(11) NOT NULL,
    output_channel__id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE media__resource (
    resource__id int(11) NOT NULL,
    media__id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE media_element (
    id int(11) auto_increment NOT NULL,
    element_type__id int(11) NOT NULL,
    object_instance_id int(11) NOT NULL,
    parent_id int(11),
    place int(11) NOT NULL,
    object_order int(11) NOT NULL,
    related_story__id int(11),
    related_media__id int(11),
    active bool DEFAULT 1 NOT NULL,
    displayed bool DEFAULT 0 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media_field (
    id int(11) auto_increment NOT NULL,
    field_type__id int(11) NOT NULL,
    object_instance_id int(11) NOT NULL,
    parent_id int(11) NOT NULL,
    place int(11) NOT NULL,
    hold_val bool DEFAULT 0 NOT NULL,
    object_order int(11) NOT NULL,
    date_val timestamp,
    short_val text,
    blob_val text,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media_fields (
    id int(11) auto_increment NOT NULL,
    biz_pkg int(11) NOT NULL,
    name varchar(32) NOT NULL,
    function_name text NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media_instance (
    id int(11) auto_increment NOT NULL,
    name text,
    description text,
    media__id int(11) NOT NULL,
    usr__id int(11) NOT NULL,
    version int(11),
    category__id int(11) NOT NULL,
    media_type__id int(11) NOT NULL,
    primary_oc__id int(11) NOT NULL,
    file_size int(11),
    file_name text,
    `location` text,
    uri text,
    checked_out bool DEFAULT 0 NOT NULL,
    note text,
    cover_date timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media_keyword (
    media_id int(11) NOT NULL,
    keyword_id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE media_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media_type (
    id int(11) auto_increment NOT NULL,
    name varchar(128) NOT NULL,
    description text,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media_type_ext (
    id int(11) auto_increment NOT NULL,
    media_type__id int(11) NOT NULL,
    extension varchar(10) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media_type_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE media_uri (
    id int(11) auto_increment NOT NULL,
    media__id int(11) NOT NULL,
    site__id int(11) NOT NULL,
    uri text NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE member (
    id int(11) auto_increment NOT NULL,
    grp__id int(11) NOT NULL,
    class__id int(11) NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE org (
    id int(11) auto_increment NOT NULL,
    name varchar(64) NOT NULL,
    long_name varchar(128),
    personal bool DEFAULT 0 NOT NULL,
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE org_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE output_channel (
    id int(11) auto_increment NOT NULL,
    name varchar(64) NOT NULL,
    description text,
    site__id int(11) NOT NULL,
    protocol varchar(16),
    filename varchar(32) NOT NULL,
    file_ext varchar(32),
    primary_ce bool,
    uri_format varchar(64) NOT NULL,
    fixed_uri_format varchar(64) NOT NULL,
    uri_case smallint DEFAULT 1 NOT NULL,
    use_slug bool DEFAULT 0 NOT NULL,
    active bool DEFAULT 1 NOT NULL,
    burner smallint NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE output_channel_include (
    id int(11) auto_increment NOT NULL,
    output_channel__id int(11) NOT NULL,
    include_oc_id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE output_channel_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE person (
    id int(11) auto_increment NOT NULL,
    prefix varchar(32),
    lname varchar(64),
    fname varchar(64),
    mname varchar(64),
    suffix varchar(32),
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE person__contact_value (
    person__id int(11) NOT NULL,
    contact_value__id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE person_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE person_org (
    id int(11) auto_increment NOT NULL,
    person__id int(11) NOT NULL,
    org__id int(11) NOT NULL,
    `role` varchar(64),
    department varchar(64),
    title varchar(64),
    active bool DEFAULT 1 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE person_org__addr (
    addr__id int(11) NOT NULL,
    person_org__id int(11) NOT NULL
) TYPE=MyISAM;

CREATE TABLE pref (
    id int(11) auto_increment NOT NULL,
    name varchar(64) NOT NULL,
    description text,
    value text,
    def text,
    manual bool DEFAULT 0 NOT NULL,
    opt_type varchar(16) NOT NULL,
    can_be_overridden bool DEFAULT 0 NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE pref_member (
    id int(11) auto_increment NOT NULL,
    object_id int(11) NOT NULL,
    member__id int(11) NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

CREATE TABLE pref_opt (
    pref__id int(11) NOT NULL,
    value text NOT NULL,
    description text
) TYPE=MyISAM;

CREATE TABLE resource (
    id int(11) auto_increment NOT NULL,
    parent_id int(11),
    media_type__id int(11) NOT NULL,
    path text NOT NULL,
    uri text NOT NULL,
    size int(11) NOT NULL,
    mod_time timestamp NOT NULL,
    is_dir bool NOT NULL
, PRIMARY KEY(`id`)
) TYPE=MyISAM;

