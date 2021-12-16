require 'pg'
require 'date'
require_relative 'database_connection'


class Spaces
  attr_reader :space_id, :space_name, :space_description, :price_per_night, :user_id

  def initialize(space_id, space_name, space_description, price_per_night, user_id)
    @space_id = space_id
    @space_name = space_name
    @space_description = space_description
    @price_per_night = price_per_night
    @user_id = user_id
  end

    def self.all
    table = DatabaseConnection.query('SELECT * FROM spaces ORDER BY space_id ASC') 
    table.map do |space|
      Spaces.new(space['space_id'], space['space_name'], space['space_description'], 
     space['price_per_night'], space['user_id'])
    end  
  end

  def space_display
      "<h2>#{@space_name}</h2>
      <h3>#{@space_description}</h3>"
  end

  def self.add_space(space_name, space_description, price_per_night, user_id)
    rs = DatabaseConnection.query(
"INSERT INTO spaces (space_name, space_description, price_per_night, user_id) VALUES ('#{space_name}', '#{space_description}', #{price_per_night}, #{user_id}) RETURNING space_id;")
    rs[0]['space_id']
  end

  def self.add_availability(space_id, stay_start, stay_finish)
    dates = (Date.parse(stay_start).strftime..Date.parse(stay_finish).strftime).to_a
    
    dates.each do |date| 
      DatabaseConnection.query(
        "INSERT INTO availability (space_id, dates) VALUES ($1, $2)", [
          space_id, date])
    end
    
  end

end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM spaces WHERE id = ($1)", [id])
  end

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
