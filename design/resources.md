Question - why do we want revisions?

###Endpoints

- GET: /api/note/ - returns the latest revision of all notes (do we want this?) 
    - Reads off of document store
- GET: /api/note/{id} - returns the latest revision of a single note
- GET: /api/note/{id}/revisions - returns all revision of a single note (think about what the DTOs look like)
    - Reads off of graph store
- POST: /api/note/ - creates a note
- PUT: /api/note/{id} - creates a new revision


Note: { id, note, ancestor }
Note with revisions: { [ Notes ] }

{4, "text here", 3 } <- doc
    {3, "text was here", 2} <- doc
        {2, "bad text", null} <- doc
 
 
 