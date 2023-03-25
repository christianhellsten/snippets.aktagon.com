---
id: '582'
title: SQLAlchemy example
languages:
- python
tags:
---
SQLAlchemy example:


```python
from sqlalchemy import *
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

engine = create_engine("mysql://username:password@localhost/database_name")
engine.echo = False

Base = declarative_base()

class Entry(Base):
    __tablename__ = "entries"
    id = Column(Integer, primary_key=True)
    title = Column(String(255))
    url = Column(String)

    def __repr__(self):
        return "<Entry('%s', '%s')>" % (self.title, self.url)

# Set up handles
entry_table = Entry.__table__
metadata = Base.metadata
metadata.create_all(engine)

# Start a session
Session = sessionmaker(bind=engine)
session = Session()
 
# Query entries
entries = session.query(Entry) \
    .filter(Entry.title != 'Zermatt')

# Print all entries
for entry in entries.all():
    print entry.update_named_entities()

# Print first entry
entry = entries.first()

# Update entry
entry.title = 'Zermatt, Verbier'

# Commit changes
session.commit()
```
    

