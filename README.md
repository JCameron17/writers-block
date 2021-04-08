Original App Design Project - README Template
===

# Writer's Block

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
If you ever need to write anything: a paper, a poem, an email, then Writer' Block is for you. This app defines words, finds synonyms, and even gives you examples for how to use the words you search. 

APIs Used: 
* [Merriam-Webster's Collegiate Dictionary with Audio]("https://dictionaryapi.com/products/api-collegiate-dictionary")
* [Merriam-Webster's Thesaurus]("https://dictionaryapi.com/products/api-collegiate-thesaurus")
* [Datamuse]("http://www.datamuse.com/api/")
* Apple's Accessibility Settings

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Productivity
- **Mobile:**
- **Story:** Whether you're completing a paper, poem, Yelp Review or even an email, we all know what it's like to be searching for the perfect word. That's why we need writer's block, a quick and easy way to find the perfect word and exactly what it means. Writer's block is a one stop shop whether you need a dictionary, thesaurus, or a reference, user's of all ages can utilize this easy and intuitive app. 

- **Market:** The market for Writer's Block is huge, anyone who reads or writes english, which includes users from all over the world.The potential user base could be up to hundreds of thousands of users considering how often we all search word definitions and synonyms. This isn't a particularly niche app, it applies to a wide variety of different users. 
- **Habit:** Writer's Block could potentially be very habit forming, especially for users that write on a regular basis (i.e. students,authors, bloggers). Users are not creating their own content, they are simply consuming Writer's Block.
- **Scope:** The scope for this app is very clear: it is a dictionary, thersauras, and reference for it's users. It is not too technically challenging for the time we will have to complete the project. Even if a stripped down version of the app is developed it can still be quite useful to any writers. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can search for a word.
* User can view a word's definition, pronunciation, and example sentence.
* User can view a word's synonyms and antonyms.
* User can view references for given word.

**Optional Nice-to-have Stories**

* User can enter slang words to find their definition.
* User can view the word's related information, based on the chosen tab (clicking between screens will given corresponding definition, synonym, or reference for that word).

### 2. Screen Archetypes

* Dictionary Search / Stream
   * User can search for a word.
* Dictionary Detail
    * User can view a word's definition, pronunciation, and example sentence.
* Thesaurus Search / Stream
   * User can search for a word.
* Thesaurus Detail
    * User can view synonyms of a word.
* Reference Search / Stream
    * User can find a reference for a word.
* Reference Detail
    * User can view references for given word.
* Settings
    * User can edit settings for better accessibility.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Dictionary Tab <--> Dictionary Stream
* Thesaurus Tab <--> Thesaurus Stream
* Reference Tab <--> Reference Stream

**Flow Navigation** (Screen to Screen)

* Dictionary Stream
    * Dictionary Stream --> Dictionary Detail
    * Dictionary Stream --> Settings
* Dictionary Detail
    * Dictionary Stream --> Dictionary Stream
* Thesaurus Stream
    * Thesaurus Stream --> Thesaurus Detail
    * Thesaurus Stream --> Settings
* Thesaurus Detail
    * Thesaurus Stream --> Thesaurus Stream
* Reference Stream
    * Reference Stream --> Reference Detail
    * Reference Stream --> Settings
* Reference Detail
   *  Reference --> Reference Stream
* Settings
   * Settings --> Dictionary Stream
   * Settings --> Thesaurus Stream
   * Settings --> Reference Stream

## Wireframes
<img src="http://g.recordit.co/djrbrc515z.gif">


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
### Models
Word Model
| Property | Type | Description |
|----------|------|-------------|
|searchedWord| String | word the user intends to look up|
|wordDefinition| Object | API reference call to definition of searchedWord|
|wordSynonyms| Object | API reference call to synonyms of searchedWord|
|wordAytonyms| Object | API reference call to antonyms of searchedWord|
|wordReferences| Object | API reference call to references of searchedWord|

Settings Model
| Property | Type | Description |
|----------|------|-------------|
|textSize| Integer | size of text throughout the application|
|playbackVolume| Integer | volume of text to speech |
|playbackSpeed| Integer | speed of text to speech |

### Networking
Dictionary Network Requests
| HTTP Verb | Endpoint | Description|
|-----------|----------|------------|
| GET | /words | gets all words |
| GET | /words?sp=word | gets searched word |
| GET | /words?sp=word&md=dpr | gets definition, part of speech, and pronunciation of searched word |

Thesaurus Network Requests
| HTTP Verb | Endpoint | Description|
|-----------|----------|------------|
| GET | /words | gets all words |
| GET | /words?sp=word | gets searched word |
| GET | /words?ml=word | gets words with a meaning similar to the searched word |
