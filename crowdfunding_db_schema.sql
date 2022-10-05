campaign
-
cf_id int PK
contact_id int FK - contacts.contact_id
company_name object
description object
goal float
pledged float
outcome object
backers_count int
country object
currency object
launch_date object
end_date object
category_id object FK >- category.category_id
sub-category_id object FK >- subcategory.subcategory_id

contacts
-
contact_id int
first_name object
last_name object
email object

category
-
category_id object
category_name object

subcategory
-
subcategory_id object
subcategory_name object