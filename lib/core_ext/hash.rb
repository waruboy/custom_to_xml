class Hash
  def tau
    puts "custom beibih"
  end

  def to_xml(options = {})
    require 'active_support/builder' unless defined?(Builder)

    options = options.dup
    options[:indent]  ||= 2
    options[:root]    ||= 'hash'
    options[:builder] ||= Builder::XmlMarkup.new(indent: options[:indent])

    builder = options[:builder]
    builder.instruct! unless options.delete(:skip_instruct)

    root = ActiveSupport::XmlMini.rename_key(options[:root].to_s, options)

    builder.tag!(root) do
      each { |key, value| ActiveSupport::XmlMini.to_tag(key, value, options) }
      yield builder if block_given?
    end
  end
end
