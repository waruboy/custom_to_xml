class Hash
  def tau
    puts "custom beibih"
  end

  def to_tau_xml(options = {})
    require 'active_support/builder' unless defined?(Builder)

    options = options.dup
    options[:indent]  ||= 2
    options[:root]    ||= 'hash'
    options[:tags_label] ||= 'tags'
    options[:builder] ||= Builder::XmlMarkup.new(indent: options[:indent])

    builder = options[:builder]
    builder.instruct! unless options.delete(:skip_instruct)

    root = ActiveSupport::XmlMini.rename_key(options[:root].to_s, options)

    builder.tag!(root) do
      each do |key, value|
        if key == options[:tags_label]
          builder.tags do |tag_nodes|
            value.each do |key2, value2|
              tag_nodes.tag(value2, "attribute" => key2)
            end
          end 
        else 
          ActiveSupport::XmlMini.to_tag(key, value, options)
        end
      end
      yield builder if block_given?
    end
  end
end
