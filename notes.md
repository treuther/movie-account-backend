Genre
has_many :movies
:name - string


Movie
belongs_to :genre
:genre_id - integer
:title - string
:rating - string
:description - string

FRONT-END application was created with create-react-app.
You still have to add the following on the FRONTEND:
npm install redux --save
npm install react-redux --save
npm install redux-thunk --save
npm install react-router-dom --save