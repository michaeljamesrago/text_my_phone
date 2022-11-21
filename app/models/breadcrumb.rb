class Breadcrumb
  include ActiveModel::Conversion
  attr_reader :name, :path

  def initialize(name, path)
    @name = name
    @path = path
  end

  def link?
    @path.present?
  end

  def to_partial_path
    "layouts/breadcrumb"
  end
end