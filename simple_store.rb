class SimpleStore
  def initialize(attributes = {})
    update(attributes)
  end

  def destroy
    self.class.remove(self)
    self.freeze
  end

  def update(attributes)
    attributes.each_pair do |attribute, value|
      self.public_send "#{attribute}=", value
    end
  end

  def save
    self.class.add(self)
  end

  def id
    self.class.items.key(self)
  end

  def self.add(item)
    items.store(next_id, item)
  end

  def self.all
    items.values
  end

  def self.create(*arguments)
    item = new(*arguments)
    add(item)
    item
  end

  def self.items
    @items ||= Hash.new
  end

  def self.get(id)
    items.fetch(id.to_i)
  end

  def self.remove(item)
    items.delete(item.id)
  end

  def self.next_id
    @next_id ||= 0
    @next_id += 1
  end
end
