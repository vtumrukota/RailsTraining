module RecentHelper
  def method_missing (name, *args, &block)
    n = name.to_s.downcase
    num = n.split('find_recent_')

    if num[0] == "" && num.length == 2
      if num[1].to_i.to_s == num[1]
        return self.all.order('created_at DESC').limit(num[1].to_i)
      end
    end
    return "Sorry, the #{name} method doesn't exist!"
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?('find_recent_') || super
  end
end
