actions :checkout

attribute :dir,         :kind_of => String, :name_attribute => true
attribute :user,        :kind_of => String, :required => true
attribute :group,       :kind_of => String, :required => true
attribute :repository,  :kind_of => String, :required => true
attribute :reference,   :kind_of => String, :required => true
attribute :log_dir,     :kind_of => String, :required => true