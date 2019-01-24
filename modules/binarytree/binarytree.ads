with utils;

package binarytree is

   type binarytree_node is limited private;
   type binarytree_root is limited private;

   procedure init (root : out binarytree_root; debug : in Boolean);

   procedure allocate_node (q : out binarytree_node; value : in Integer);
   procedure insert_node (
      parent : in out binarytree_node;
      to_insert : in out binarytree_node; value : in Integer;
      debug : Boolean
   );

   procedure insert (root : binarytree_root; value : in Integer);

   function has (root : binarytree_root; value : in Integer) return Boolean;
   function hasleft (root : binarytree_root) return Boolean;
   function hasleft (node : binarytree_node) return Boolean;
   function hasright (root : binarytree_root) return Boolean;
   function hasright (node : binarytree_node) return Boolean;
   function count (root : binarytree_root) return Integer;

   procedure traverse_inorder (root : in binarytree_root;
      vec : out utils.IntegerVector.Vector);

   function value (node : in binarytree_node) return Integer;

private

   procedure find (
      root : in binarytree_root;
      value : in Integer;
      found : out binarytree_node
   );

   type root;
   type binarytree_root is access root;

   type node;
   type binarytree_node is access node;

   type node is
   record
       llink, rlink : binarytree_node;
       node_value : Integer;
   end record;

   type root is
   record
       node : binarytree_node;
       node_count : Integer;
       debug : Boolean;
   end record;

end binarytree;
