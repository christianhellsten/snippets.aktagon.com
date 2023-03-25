---
id: '636'
title: Recursive Postgres Query That Finds Descendants of a Node in a Tree
languages:
- ruby
- sql
tags:
---
Voilà, the recursive query we are going disect in this snippet:


```sql
WITH RECURSIVE tree AS (
  SELECT id, name, parent_id FROM nodes WHERE id = 25
  UNION ALL
  SELECT nodes.id, nodes.name, nodes.parent_id FROM nodes, tree WHERE nodes.parent_id = tree.id)
```
    

Here we define a virtual table called tree:


```sql
WITH RECURSIVE tree
```
    

This SQL finds the root node and initializes the recursive function:


```sql
SELECT id, name, parent_id FROM nodes WHERE id = 25
```
    

The next part recursively fetches the descendants of the root node:


```sql
SELECT nodes.id, nodes.name, nodes.parent_id FROM nodes, tree WHERE nodes.parent_id = tree.id)
```

This SQL query fetches the root node and all its descendants from the tree:

```sql
SELECT * FROM tree;
```

## ActiveRecord / Rails

This example shows how to use CTEs in ActiveRecord to find the parent and suborganizations in a conglomerate:

```ruby
class Organization
  belongs_to :parent, class_name: 'Organization', required: false
  has_many :children, class_name: 'Organization', foreign_key: :parent_id
  scope :roots, -> { where(parent_id: nil) }
  
  def ancestors(id, columns=Organization.column_names)
    cols = columns.join(', ')
    child_id = ActiveRecord::Base.connection.quote(id)
    Organization.from <<~SQL
      (WITH RECURSIVE org_tree(#{cols}, path) AS (
        SELECT
          #{cols}, ARRAY[id]
        FROM
          organizations
        WHERE
          id = #{child_id}
      UNION ALL
        SELECT
          #{columns.map { |col| "organizations.#{col}" }.join(', ') }, path || organizations.id
        FROM
          org_tree
        JOIN
          organizations ON organizations.id = org_tree.parent_id
        WHERE NOT
          organizations.id = ANY(path) -- avoid infinite loops where e.g. parent = self
      ) SELECT #{cols} FROM org_tree WHERE id != #{child_id}) as organizations
    SQL
  end

  def descendants(id, columns=Organization.column_names)
    cols = columns.join(', ')
    parent_id = ActiveRecord::Base.connection.quote(id)
    Organization.from <<~SQL
      (WITH RECURSIVE org_tree(#{cols}, path) AS (
        SELECT
          #{cols}, ARRAY[id]
        FROM
          organizations
        WHERE
          id = #{parent_id}
      UNION ALL
        SELECT
          #{columns.map { |col| "organizations.#{col}" }.join(', ') }, path || organizations.id
        FROM
          org_tree
        JOIN
          organizations ON organizations.parent_id = org_tree.id
        WHERE NOT
          organizations.id = ANY(path) -- avoid infinite loops where e.g. parent = self
      ) SELECT #{cols} FROM org_tree WHERE id != #{parent_id}) as organizations
    SQL
  end
end
```

```ruby
# Find parent companies
Organization.find(1).ancestors
# Find suborganizations
Organization.find(1).descendants
```

## Details

* Use UNION instead of UNION ALL if you have duplicates, or if you're not worried about performance when Postgres has to scan for duplicates.
* [WITH Queries in Postgres](http://www.postgresql.org/docs/8.4/static/queries-with.html)
* [Recursive queries can loop indefinitely](http://hashrocket.com/blog/posts/recursive-sql-in-activerecord) if e.g. self.parent = self. If this happens, use the ANY() function to check if path has been visited once already. Alternatively, use validations to make sure circular references don't happen, and hope for the best.
* You can use [Arel's recursive feature](https://github.com/rails/arel/blob/master/test/test_select_manager.rb#L346) to generate recursive CTE queries with Arel.
* Rails CTE gem: https://github.com/christianhellsten/cte-rails
