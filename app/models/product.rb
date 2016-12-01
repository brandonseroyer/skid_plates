class Product < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :images, dependent: :destroy
  has_attached_file :image, styles: {
    standard: '750x500',
    profile: '450x300',
    thumb: '100x100'
   }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  default_scope { where(active: true) }

  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      all
    end
  end
end
