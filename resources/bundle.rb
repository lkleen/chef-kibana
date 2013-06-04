actions :install

attribute :cwd,   :kind_of => String, :name_attribute => true
attribute :user,  :kind_of => String, :required => true
attribute :group, :kind_of => String, :required => true