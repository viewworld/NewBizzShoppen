require 'active_record/acts/deep_cloneable'
ActiveRecord::Base.class_eval { include ActiveRecord::Acts::DeepCloneable }