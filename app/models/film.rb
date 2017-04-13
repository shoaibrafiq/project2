class Film < ActiveRecord::Base
belongs_to :user
# A film  belongs to a user
belongs_to :genre
# One film belongs to one genre

has_attached_file :film_img, styles: { film_index: "250x350>", film_show: "325x475>" }, default_url: "/images/:style/missing.png"
 validates_attachment_content_type :film_img, content_type: /\Aimage\/.*\z/
 #defining the patched file for image upload
end
