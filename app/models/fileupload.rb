class Fileupload < ActiveRecord::Base
                        
    def uploaded_file=(filename)
        self.name           = base_part_of(filename.original_filename)
        #self.content_type   = filename.content_type.chomp
        self.data           = filename.read
    end
    
    def base_part_of(file_name)
        File.basename(file_name).gsub(/[^\w._-]/, '')
    end
    
    def upload
        uploaded_io = params[:fileupload][:uploaded_file]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
            file.write(uploaded_io.read)
        end
    end
        
end