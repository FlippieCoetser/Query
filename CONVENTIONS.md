## Branch and Commit Strategy
The section is targeted towards software engineers.  

However Product Owners involved in singing off user stories will typically only use a `Git Clone`,`Git switch`, `Git Pull` commands.

Although these three commands are normally not the first commands a developer will use, we briefly introduce the three commands with examples.

### Git Clone
Create a local copy of a cloud repository

> Example:  
> `git clone https://github.com/hassanhabib/StandardR.git`

### Git Switch
After cloning the code repository, switch to the branch ready for acceptance testing:

> Example:  
> `git switch users/FlippieCoetser/Foundations-Todo-Retrieve`

### Git Pull
Ensure your local branch is update, via a git pull

> Example: 
> `git pull`

### Git Branches
Repository core branches is always based on an agile requirement: User Story. 

> Example:  
> As a `user`,  
> When I want to plan my day,  
> I want to `see` a list of `todos`,  
> So that I can prioritize my work.  

1. Based on the assigned user story, a software engineer identifies the dependency path towards the data store

> Example:  
> * User Interface: `See` todos  
> * Service: `Retrieve` todos 
> * Broker: `Select` todos  

2. Using the dependency path, a work package is identified, using a standardized list:

INFRA, PROVISION, RELEASE, DATA, BROKERS, FOUNDATIONS, VIEWS, PROCESSING, ORCHESTRATION, COORDINATIONS, MANAGEMENT, AGGREGATIONS, CONTROLLERS, BASE, COMPONENTS, PAGES, ACCEPTANCE, INTEGRATIONS, CODE RUB, DOCUMENTATION, CONFIG, MINOR FIX, MEDIUM FIX, MAJOR FIX, REVIEW, STANDARD, DESIGN, BUSINESS, UNKNOWN

> Example:  
>  `create a new service and implement an operations to retrieve a data frame filled with todos`

3. Identify the entity and action for type work package; brokers typically have: 

Create, Retrieve, RetrieveById, Update, Delete

> Example: 
> Type: `foundations`  
> Entity: `todo` (singular form of `todos` as in user story)  
> Action: `retrieve`

3. Create a new branch for user story and name according to the following convention:  
`users/{GitHubUsername}/{Type} {Entity} {Action}`

> Example:  
> `users/FlippieCoetser}/Foundations-Todo-Retrieve`

* Create new local branch

> Example:  
> `git checkout -b users/FlippieCoetser/Foundations-Todo-Retrieve`

* Create new cloud branch

> Example:  
> `git push --set-upstream origin users/FlippieCoetser/Foundations-Todo-Retrieve`

### Git Commits

TDD Approach requires a failing and passing unit test.
This is also visible in commit messages: Commit messages are sequenced in pairs starting with status `FAIL` and follows by status `PASS`

The complete convention for commit messages is:  

`{Type}: {TestCondition} -> {Status}`

1. Extract Type from Branch name

> Example: 
> `FOUNDATIONS`

2. Define Acceptance Criteria 

> Example:  
> `Retrieve todos`


3. Add Status: FAIL, PASS, WIP  

> Example:  
> `FAIL`

4. Complete Commit Message

### Git Pull Request

After passing all acceptance criteria, a pulls request can be made to merge the functionality into the main branch.

Pull request title also follows a specific convention: `{Type}: {UserStory}`

### Git Branch list
As branches are merged back into main and deleted, a local synchronization and clean up will be needed.

1. Update list of cloud branches

> Example:  
> `git remote update origin --prune`

2. Delete local branches

> Example:  
> Delete `Foundations-Todo-Retrieve`
> `git branch -d users/FlippieCoetser/Foundations-Todo-Retrieve`