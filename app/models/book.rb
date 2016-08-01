class Book < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates_presence_of :category_id, :message => "Category is required!"
  validates_presence_of :author, :message => "Author name is required!"
  validates_presence_of :title, :message => "Title is required!"

  has_attached_file :book_img, styles: { book_index: "250x350>", book_show: "345x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\Z/
end