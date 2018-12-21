with stack;
with Ada.Text_IO; use Ada.Text_IO;

package body binarytree is

    package intio is new Ada.Text_IO.Integer_IO(Integer);

    node_count: Integer := 0;
    root : binarytree_node;

    procedure init is
    begin
        root := null;
    end;

    procedure insert(value: in Integer) is
        p: binarytree_node;
        q: binarytree_node;
    begin
        node_count := node_count + 1;
        if root = null then
            allocate_node(q, value);
            root := q;
        else
            p := root;
            loop
                if value < p.value then
                    if p.llink /= null then
                        p := p.llink;
                    else
                        allocate_node(q, value);
                        insert_node(p, q, value);
                        exit;
                    end if;
                elsif value > p.value then
                    if p.rlink /= null then
                        p := p.rlink;
                    else
                        allocate_node(q, value);
                        insert_node(p, q, value);
                        exit;
                    end if;
                else
                    exit;
                end if;
            end loop;
        end if;
    end insert;

    procedure allocate_node(q: out binarytree_node; value: in Integer) is
    begin
        q := new node;
        q.value := value;
        q.llink := null;
        q.rlink := null;
    end;

    procedure insert_node(parent: in out binarytree_node; q: in out binarytree_node; value: in Integer) is
    begin
        if value < parent.value then
            parent.llink := q;
        else
            parent.rlink := q;
        end if;
    end;

    procedure find(value: in Integer; found: out binarytree_node) is
        cur: binarytree_node := root;
        find_count: Integer := node_count;
    begin
        loop
            if find_count = 0 then
                found := root;
                exit;
            end if;

            if cur /= null then
                if cur.value = value then
                    found := cur;
                    exit;
                elsif cur.value < value then
                    cur := cur.llink;
                else
                    cur := cur.rlink;
                end if;
            else
                exit;
            end if;
            find_count := find_count - 1;
        end loop;
        found := cur;
    end find;

    function has(value: in Integer) return Boolean is
        found: binarytree_node := null;
    begin
        find(value, found);
        return found /= null;
    end has;

    procedure traverse_inorder(start_node: in binarytree_node) is
        package node_stack is new stack(max => node_count, item => binarytree_node);

        cur: binarytree_node;
        x: binarytree_node;
    begin
        if start_node = null then
            cur := root;
        else
            cur := start_node;
        end if;
        loop
            if cur /= null then
                node_stack.push(cur);
                cur := cur.llink;
            else
                if node_stack.empty then
                    exit;
                else
                    node_stack.pop(x);
                    intio.Put(x.value, width => 0);
                    Ada.Text_IO.Put(", ");
                    cur := x.rlink;
                end if;
            end if;
        end loop;
        Ada.Text_IO.Put_Line("");
    end;

    function value(node: in binarytree_node) return Integer is
    begin
        return node.value;
    end;

end binarytree;
