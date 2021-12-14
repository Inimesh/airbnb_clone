# require 'pg'
# require_relative 'database_connection'

# class Bookmarks
#   attr_reader :id, :url, :title, :comments

#   def initialize(id, url, title)
#     @id = id
#     @url = url
#     @title = title
#   end
  
#   def self.all
#     table = DatabaseConnection.query('TABLE bookmarks ORDER BY id ASC') 
#     table.map { |bookmark| Bookmarks.new(bookmark['id'], bookmark['url'], bookmark['title']) }
#   end

#   def self.add(url, title)
#     return false unless self.is_url?(url)
#     DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ($1, $2)", [url, title])
#   end

#   def self.delete(id)
#     DatabaseConnection.query("DELETE FROM bookmarks WHERE id = ($1)", [id])
#   end

#   def self.edit(id, new_url, new_title)
#     DatabaseConnection.query("UPDATE bookmarks SET url = ($1), title = ($2) WHERE id = ($3)", [new_url, new_title, id])
#   end

#   def display
#     "<a class='bm-link' href='#{@url}'>#{@title}</a>"
#   end

#   def delete_button
#     "<form class='#{@title} bm-delete-button' action='/delete_bookmark' method='post'>
#       <input type='hidden' name='to_delete' value='#{@id}'>
#       <button type='submit' value='Delete'><i class='fas fa-trash-alt fa-5x'></i></button>
#     </form>"    
#   end

#   def edit_button
#     "<div class='#{@title} bm-edit-button'>
#       <button type='submit' value='Edit' onclick='toggleEditForm(#{@id})'><i class='fas fa-edit fa-5x'></i></button>
#     </div>" 
#   end

#   def edit_form
#     "<form id='edit-bookmark-#{@id}' class='#{@title} bm-edit-form' action='/edit_bookmark' method='post'>
#       <input type='hidden' name='to_edit' value='#{@id}'>
#       <input type='text' name='new_url' placeholder='#{@url}'>
#       <input type='text' name='new_title' placeholder='#{@title}'>
#       <input type='submit' value='Edit'> 
#     </form>" 
#   end

#   def comments_button
#     "<div class='#{@title} bm-comments-button'>
#       <button type='submit' value='Comments' onclick='toggleComments(#{@id})'><i class='far fa-comment fa-5x'></i></button>
#     </div>" 
#   end

#   def add_comment_form
#     "<form id='add-comment-#{@id}' class='#{@title} bm-comment-form' action='/new_comment' method='post'>
#       <input type='hidden' name='bookmark_id' value='#{@id}'>
#       <input type='text' name='text' placeholder='Enter comment'>
#       <button type='submit' value='Add Comment'><i class='fas fa-plus fa-2x'></i></button> 
#     </form>"  
#   end

#   def tags_button
#     "<div class='#{@title} bm-tags-button'>
#       <button type='submit' value='Tags' onclick='toggleTags(#{@id})'><i class='far fa-sticky-note fa-5x'></i></button>
#     </div>" 
#   end

#   def add_tag_form
#     "<form id='add-tag-#{@id}' class='#{@title} bm-tag-form' action='/new_tag' method='post'>
#       <input type='hidden' name='bookmark_id' value='#{@id}'>
#       <input type='text' name='content' placeholder='Enter tag'>
#       <button type='submit' value='Add Tag'><i class='fas fa-plus fa-2x'></i></button> 
#     </form>"  
#   end

#   private

#   def self.is_url?(url)
#     url =~ /\A#{URI::regexp(['http', 'https'])}\z/
#   end

# end
