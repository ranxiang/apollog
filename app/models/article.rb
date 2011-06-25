class Article < ActiveRecord::Base
  acts_as_taggable
  default_scope order('created_at DESC')
  validates_presence_of :title
  validates_uniqueness_of :title, :allow_nil => false, :allow_blank => false
  validates_uniqueness_of :name, :allow_nil => false, :allow_blank => false
  validates_inclusion_of :status, :in => [:TRASH, :AUTO_DRAFT, :DRAFT, :PUBLISH]

  def status
    read_attribute(:status).to_sym
  end

  def status= (value)
    write_attribute(:status, value.to_s)
  end

end
