package binarytree is

    type binarytree_node is limited private;

    procedure init;
    
    procedure allocate_node(q: out binarytree_node; value: in Integer);
    procedure insert_node(parent: in out binarytree_node; q: in out binarytree_node; value: in Integer);
    procedure insert(value: in Integer);

    procedure find(value: in Integer; found: out binarytree_node);

    procedure traverse_inorder(start_node: in binarytree_node);

    function value(node: in binarytree_node) return Integer;

private

    type node;
    type binarytree_node is access node;

    type node is
    record
        llink, rlink: binarytree_node;
        ltag, rtag: boolean; -- true: link is child, false: link is thread
        value: Integer;
    end record;

end binarytree;
