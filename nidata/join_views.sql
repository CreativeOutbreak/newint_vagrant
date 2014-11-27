/*  Select all user and there email address if it exists. contact values with an id or 1 or 2 can be email addresses. all other are other contact details like number. */
CREATE VIEW view_users_dis as select distinct on(t1.id) t1.*, t2.login, t2.password, t5.value as email from person t1 left join usr t2 on t1.id = t2.id left join person__contact_value t4 on t1.id = t4.person__id left join (select * from contact_value where contact__id < 3) t5 on t4.contact_value__id = t5.id;

/* Blog stories have an id of 1100, so this just gets the blog stories. */
CREATE VIEW view_blog_story as select * from story where element_type__id = 1100;

/* Blog teasers have a field_type_id of 1247, so this simply gets all the blog teasers */
CREATE VIEW view_blog_teasers as select * from story_field where field_type__id = 1247;
/* Blog body text has a field_type_id of 1248, so this simply gets all the blog body text fields */
CREATE VIEW view_blog_body_text as select * from story_field where field_type__id = 1248;

/* This statment create a view of all the blog articles that are the first ever version of them and no repitition. */
CREATE VIEW view_blog_aticle_v1 as select t1.story__id, t1.version, t1.usr__id, t1.slug, t1.name, t3.short_val as teaser, t4.short_val as body_text from story_instance t1 right join view_blog_story t2 on t1.story__id = t2.id left join view_blog_teasers t3 on t1.id = t3.object_instance_id left join view_blog_body_text t4 on t1.id = t4.object_instance_id where t1.version = 1;

/* This statment is the same as above except it get all versions except the first on. */
CREATE VIEW view_blog_aticle_revisions as select t1.story__id, t1.version, t1.usr__id, t1.slug, t1.name, t3.short_val as teaser, t4.short_val as body_text from story_instance t1 right join view_blog_story t2 on t1.story__id = t2.id left join view_blog_teasers t3 on t1.id = t3.object_instance_id left join view_blog_body_text t4 on t1.id = t4.object_instance_id where t1.version != 1;



CREATE VIEW view_keyword_csv as select t1.story_id, string_agg(t2.name, ',') as keywords from story_keyword t1 left join keyword t2 on t1.keyword_id = t2.id group by t1.story_id order by t1.story_id;


CREATE VIEW view_image_relation as select distinct on(t2.object_instance_id) t2.object_instance_id as story_instance_id, 'http://newint.org' || t1.uri as new_uri from media_instance t1 left join story_element t2 on t1.media__id = t2.related_media__id  where t1.media_type__id = 58 or t1.media_type__id = 60 or t1.media_type__id = 61;




create view view_publish_dates as select max(comp_time) as publish_time, story_instance__id from job group by story_instance__id;

/*create view view_user_rel as select * from person_member t1 left join migrate_map_newintusersql t2 on t1.object_id = t2.sourceid1;

create view view_contributors as select t1.id, string_agg(to_char(t3.destid1, '99999'), ',') as contrib from story_instance t1 left join story__contributor t2 on t1.id = t2.story_instance__id left join view_user_rel t3 on t2.member__id = t3.member__id group by t1.id;
*/

/*create view view_contributors as select t1.id, string_agg(to_char(t3.destid1, '99999'), ',') as contrib from story_instance t1 left join story__contributor t2 on t1.id = t2.story_instance__id left join migrate_map_newintusersql t3 on t1.usr__id = t3.sourceid1 group by t1.id;

*/

/* view_blog_article_v1 */
create view view_blog_story_v1 as select t1.id, t1.first_publish_date, t1.publish_date, t1.publish_status, t1.primary_uri, t1.current_version, t1.published_version, t2.keywords, t3.new_uri from view_blog_story t1 left join view_keyword_csv t2 on t1.id = t2.story_id left join view_image_relation t3 on t1.id = t3.story_instance_id;
create view view_blog_instance_v1 as select t1.story__id, t1.version, t1.usr__id, t1.name, t1.slug, t1.note, t2.short_val as teaser, t3.short_val as body_text from story_instance t1 left join view_blog_teasers t2 on t1.id = t2.object_instance_id left join view_blog_body_text t3 on t1.id = t3.object_instance_id where t1.version = 1;
create view view_blog_article_v1 as select distinct on(t1.id) t1.*, t2.version, t2.usr__id, t2.name, t2.slug, t2.teaser, t2.body_text, t2.note from view_blog_story_v1 t1,  view_blog_instance_v1 t2 where t1.id = t2.story__id;
create view view_blog_article_wt_v1 as select distinct on(t1.id) t1.*, t2.publish_time from view_blog_article_v1 t1 left join view_publish_dates t2 on t1.id = t2.story_instance__id;

/*create view view_blog_article_wtac_v1 as select distinct on(t1.id) t1.*, t2.contrib from view_blog_article_wt_v1 t1 left join view_contributors t2 on t1.id = t2.id;
*/



/* view_blog_article_revisions */

create view view_blog_instance_revisions as select t1.story__id, t1.version, t1.usr__id, t1.name, t1.slug, t1.note, t2.short_val as teaser, t3.short_val as body_text from story_instance t1 left join view_blog_teasers t2 on t1.id = t2.object_instance_id left join view_blog_body_text t3 on t1.id = t3.object_instance_id where t1.version != 1;
create view view_blog_article_revisions as select distinct on(t1.id,t2.version) t1.*, t2.version, t2.usr__id, t2.name, t2.slug, t2.teaser, t2.body_text, t2.note from view_blog_story_v1 t1,  view_blog_instance_revisions t2 where t1.id = t2.story__id;
create view view_blog_article_wt_revisions as select distinct on(t1.id, t1.version) t1.*, t2.publish_time from view_blog_article_revisions t1 left join view_publish_dates t2 on t1.id = t2.story_instance__id;


create view view_blog_article_wid_revisions as select cast((id || '' || version) as int) as rev_id, *, first_publish_date + version * cast('1 second' as interval) as rev_date from view_blog_article_wt_revisions where publish_status = true;

/*create view view_blog_article_wtac_revisions as select distinct on(t1.id,t1.version) t1.*, t2.contrib from view_blog_article_wid_revisions t1 left join view_contributors t2 on t1.id = t2.id;
*/
