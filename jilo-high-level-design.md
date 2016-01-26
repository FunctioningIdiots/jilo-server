###Goal
Seamless thought capturing. 

- Capture any thought or artifact within 3 seconds of deciding you want it. 
- Inline hash-tagging
- Command-line-like interface for quick captures
- Break out to markdown for longer captures
- Back-end brain that automatically associates and organizes

###Scope
For now, I will write the client only. That will persist data into a cloud based storage.

###Technology Requirements
####Editor

- Cross-platform - windows and linux at minimum
- Snappy - opens, closes, and accepts input quickly
- Extensions - must allow for easy extensions
- Easy to craft user-interface - familiar, open technologies
- Open format - markdown

For these reasons, we'll use HTML/CSS/Javascript hosted by Electron. A CLI will also be supported.
####Backend

- Globally available
- Cheap, cheap storage
- Event-driven - each capture will kick-off aggregates
- Language processing - stream captures through modules to parse and understand each thought
- Dynamically modular - nodes must be able to stand-up a lightweight process that will respond to new captures looking for relevance
- Graph - relationships must be discoverable and schema-less
- Immutable - all changes are appended, no data is destroyed
- Open API - allows for extensibility, export, and openness

F# is a joy and it is naturally immutable. Azure has graph services and Cortana as a service, which should make it work well for this system (along with the fact that F# is .NET).

###Editor Commands
All commands should be prepended with 'jilo' to run on command-line.

 - Notes
	 - note < url > < hash-tags >
	 - note < text > < hash-tags >  
 - Scheduling
	 - appt < text > < date-time > < hash-tags >
	 - appt < text > < date-time > < location > < hash-tags >
 - Tasks
	 - task < title > < due-date-time > < hash-tags >
 - Friends
	 - friend < name > < email | text | twitter >
 - Sharing
	 - share < jilo-id > < friend > < email | text | twitter >
	 - share < jilo-id > < address >
 - Editing - opens app or cli-editor
	 - edit < jilo-id >
 - Meta
	 - list < note | appt | tasks | hash-tags | mined-keywords >
	 - graph < hash-tags | mined-keywords > < relationship-depth >
	 - stats summary < hash-tags | mined-keywords >
	 - stats detail < hash-tags | mined-keywords >

> Written with [StackEdit](https://stackedit.io/).