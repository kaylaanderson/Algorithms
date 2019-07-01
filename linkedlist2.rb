module LinkedList

  ##
  # single element for linked list
  class LinkedListNode
    attr_accessor :value, :next_node

    def initialize(value, next_node=nil)
      @value = value
      @next_node = next_node
    end

    def reverse_list()
      s = LinkedList::Stack.new

      # put all nodes into the stack
      current = self
      loop do 
        s.push(current.value)
        break if (current.next_node == nil)
        current = current.next_node
      end

      # pull out values from stack and rebuild nodes
      current = self
      current.value = s.pop
      loop do 
        if (s.is_empty?)
          current.next_node = nil
          break;
        else
          current.next_node = LinkedList::LinkedListNode.new(s.pop)
          current = current.next_node
        end
      end

    end

    def print_values
      print "#{@value} ---> "
      if @next_node 
        @next_node.print_values
      else
        print "nil\n"
        return
      end
    end
  end

  ##
  # Stack - used in the Linked List implementation
  class Stack 
    def initialize()
      @first = nil
    end

    def push (value)
      @first = LinkedList::LinkedListNode.new(value, @first)
    end

    def pop
      raise "Stack is empty" if is_empty?
      value = @first.value
      @first = @first.next_node
      value
    end

    def is_empty?
      @first.nil?
    end
  end

end


##
## => Execution Area
##
node1 = LinkedList::LinkedListNode.new(37)
node2 = LinkedList:: LinkedListNode.new(99, node1)
node3 = LinkedList:: LinkedListNode.new(12, node2)

node3.print_values

node3.reverse_list

node3.print_values