with stack;
with Ada.Text_IO; use Ada.Text_IO;

package body binarytree is

   procedure init  (root : out binarytree_root; debug : in Boolean) is
   begin
      root := new binarytree.root;
      root.node := null;
      root.node_count := 0;
      root.debug := debug;
   end init;

   procedure insert (root : binarytree_root; value : in Integer) is
      cur : binarytree_node;
      new_node : binarytree_node;
   begin
      if root.node = null then
         allocate_node (new_node, value);
         root.node := new_node;
         root.node_count := 1;
         if root.debug then
            Put ("Allocating new root for ");
            Put_Line (Integer'Image (value));
         end if;
      else
         root.node_count := root.node_count + 1;
         cur := root.node;
         loop
            if value <= cur.node_value then
               if cur.llink /= null then
                  cur := cur.llink;
               else
                  if root.debug then
                     Put ("Allocating new node for ");
                     Put (Integer'Image (value));
                     Put (" <= ");
                     Put_Line (Integer'Image (cur.node_value));
                  end if;
                  allocate_node (new_node, value);
                  insert_node (cur, new_node, value, root.debug);
                  exit;
               end if;
            elsif value > cur.node_value then
               if cur.rlink /= null then
                  cur := cur.rlink;
               else
                  if root.debug then
                     Put ("Allocating new node for ");
                     Put (Integer'Image (value));
                     Put (" > ");
                     Put_Line (Integer'Image (cur.node_value));
                  end if;
                  allocate_node (new_node, value);
                  insert_node (cur, new_node, value, root.debug);
                  exit;
               end if;
            else
               exit;
            end if;
         end loop;
      end if;
   end insert;

   procedure allocate_node (q : out binarytree_node; value : in Integer) is
   begin
      q := new node;
      q.node_value := value;
      q.llink := null;
      q.rlink := null;
   end allocate_node;

   procedure insert_node (
      parent : in out binarytree_node;
      to_insert : in out binarytree_node; value : in Integer;
      debug : in Boolean) is
   begin
      if debug then
         Put ("Inserting ");
         Put (Integer'Image (value));
         Put (" to ");
      end if;
      if value <= parent.node_value then
         if debug then
            Put ("left");
         end if;
         parent.llink := to_insert;
      else
         if debug then
            Put ("right");
         end if;
         parent.rlink := to_insert;
      end if;
      if debug then
         Put (" of ");
         Put_Line (Integer'Image (parent.node_value));
      end if;
   end insert_node;

   procedure find (
      root : in binarytree_root;
      value : in Integer; found : out binarytree_node) is

      cur : binarytree_node := null;
   begin
      if root = null then
         found := null;
         return;
      end if;

      if root.node = null then
         found := null;
         return;
      end if;

      if root.node_count = 0 then
         found := null;
         return;
      end if;

      cur := root.node;
      loop
         if cur /= null then
            if cur.node_value = value then
               found := cur;
               if root.debug then
                  Put_Line ("Found");
               end if;
               exit;
            elsif value < cur.node_value then
               cur := cur.llink;
               if root.debug then
                  Put_Line ("Going left");
               end if;
            elsif value > cur.node_value then
               cur := cur.rlink;
               if root.debug then
                  Put_Line ("Going right");
               end if;
            end if;
         else
            found := null;
            exit;
         end if;
      end loop;
      found := cur;
   end find;

   function has (root : binarytree_root; value : in Integer) return Boolean is
      found : binarytree_node := null;
   begin
      find (root, value, found);
      return found /= null;
   end has;

   function hasleft (root : binarytree_root) return Boolean is
   begin
      if root.node /= null then
         return root.node.llink /= null;
      else
         return False;
      end if;
   end hasleft;

   function hasleft (node : binarytree_node) return Boolean is
   begin
      return node.llink = null;
   end hasleft;

   function hasright (root : binarytree_root) return Boolean is
   begin
      if root.node /= null then
         return root.node.rlink /= null;
      else
         return False;
      end if;
   end hasright;

   function hasright (node : binarytree_node) return Boolean is
   begin
      return node.rlink = null;
   end hasright;

   function count (root : binarytree_root) return Integer is
   begin
      return root.node_count;
   end count;

   procedure traverse_inorder (root : in binarytree_root;
      vec : out utils.IntegerVector.Vector) is

      package node_stack is new stack (
         max => root.node_count, item => binarytree_node);

      cur : binarytree_node := root.node;
      x : binarytree_node;
   begin
      loop
         if cur /= null then
            if root.debug then
               Put ("Push ");
               Put_Line (Integer'Image (cur.node_value));
            end if;
            node_stack.push (cur);
            cur := cur.llink;
         else
            if node_stack.empty then
               exit;
            else
               node_stack.pop (x);
               if root.debug then
                  Put ("Pop ");
                  Put_Line (Integer'Image (x.node_value));
               end if;
               vec.Append (x.node_value);
               cur := x.rlink;
            end if;
         end if;
      end loop;
   end traverse_inorder;

   function value (node : in binarytree_node) return Integer is
   begin
      return node.node_value;
   end value;

end binarytree;
