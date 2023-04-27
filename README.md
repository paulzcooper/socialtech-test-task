# socialtech-test-task

Test task from SocialTech for Product Analyst postion in Nov 2022.

## Task 1. AB testing

Given: A product, where a user can buy game currency with real money. The design team suggests to replace the current UI of the payment screen on mobile apps to increase the number of payments.
Starting July 24th 00:00am, the new UI version has been published for split user group, and the rest of users remain with the old UI version. Based on the payments data, answer the following question:

Should the new UI version be published for all users, or it be rejected?

## Task 2. Cohort analysis
 
 Using cohort ananlysis and provided data, answer the following questions:


1. How many emails on average were sent to a single user:

* within 3 months since the date of app instalation

* within 6 months since the date of app instalation
    
* within 1 year since the date of app instalation?

2. What is the average lifetime of a user?

3. Assuming the cost of 1 email delievery is $0.1, how much does the user retention for one year cost?

4. What is the average CTR for a year for users, that signed up between:

* weeks 17 and 20

* weeks 21 and 24

* weeks 25 and 28?

## Task 3. mySQL

### Task 3.1 

Given: DB contains the following tables

1. `users` — table with unique site users:
* `id` — unique user identifier
* `email` — string field containing user's email
* `id_country` — unique identifier of user's country (refers to `countries`.`id `)
* `date_reg` — user's registration date and time (i.e., «2017-02-27 10:58:05»)

2. `emails_sent` — table with sent email in a campaign:
* `id` — email id
* `id_user` — target user id (refers to `users`.`id`)
* `id_type` — email type
* `date_sent` — date and time the email was sent

3. `emails_clicks` — table with email clicks:
* `id` — email click id
* `id_email` — id of the clicked email (refers to `emails_sent`.`id`)
* `date_click` — click date and time

4. `countries` — list of countries:
* `id` — country unique id
* `name` — human-friendly country name
* `group` — country group


1. Calculate the number of registrations for new users by day and country group

2. Calculate the percent of emails, that were clicked during the first 10 mins after the email was sent, within the last 7 days; 

### Task 3.2

Given: the table `users_sessions` that contains data about users' online sessions on the product. Fiels:

* `id` - unique session identifier
* `id_user` - unique user identifier
* `action` -  field that specify the session openning or closing (‘open’ and ‘close’)
* `date_action` - timestamp of oppening/closing depending on the `action` field

Calculate the total time (unrounded) a user's sessions for each user, for every day for last 10 days (including the current day).
				
