class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    # this file here contain instructions for changing the structure of the database. This is not the database
    create_table :questions do |t|
      # although it's not explicity noted here, Rails will create a primary key called 'id' and the type of it will be 'interger serial'
      t.string :title #DB type VARCHAR (character varying)
      t.text :body #DB type TEXT

      t.timestamps # this will create two 'datetime' fields in your table called created_at and updated_at
    end
  end
end
