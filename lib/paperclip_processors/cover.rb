# Processors are required to be defined inside the Paperclip module and are also required 
# to be a subclass of Paperclip::Processor. There is only one method you must implement to 
# properly be a subclass: #make, but #initialize may also be of use. Both methods accept 3 
# arguments: the file that will be operated on (which is an instance of File), a hash of 
# options that were defined in has_attached_file's style hash, and the Paperclip::Attachment itself.
module Paperclip
  class Cover < Processor
    def initialize(file, options, attachment)
    end

    def make(file, options, attachment)
    end
  end
end
