% We load our original sequence; a string 'seq' of length 10000 
load data.mat

% We first generate all the k-mers  for this sequence
k = 10; % we will play with this later on. 
kmers = gen_kmers(seq, k); 
% kmers are stored in a cell array with each element corresponding to a string of length k.


% Now, we make the De-Bruin graph using these kmers. 
% TASK-1: Complete the function 'debg' below such that it returns the edge list (called edges) 
% of the graph where the nodes are represented as integers. 
% You must also return an array/cell (called vertices) which maps integer representation of nodes to DNA string representation.

[vertices, edges] = debg(kmers);

% We find a Eulerian walk for this graph.
% TASK-2: Complete the function 'eulerian_walk' to find a Eulerian walk 
% for the graph represented by 'edges' and 'vertices'. This function must return
% the Eulerian walk. You can also assume that there is exactly one vertex in the 
% graph whose out-degree exceeds its in-degree. This would be the starting node for the 
% Eulerian walk.

walk = eulerian_walk(edges, vertices);

% TASK 3: Complete the function 'sequence' which outputs the sequence corresponding to the Eulerian
% walk obtained earlier.  

re_seq = sequence(walk, vertices);

% We now compare the reconstructed sequence with the original sequence in 
% terms of a popular metric called 'Edit Distance'. 

distance = edit_distance(seq, re_seq);

% TASK 4: What do you see? Do you see a non-zero edit distance? Try varying the value 
% of k and plot edit distance as a function of k for k ranging from 8 to 16. What do you observe, can you explain it?


function [vertices, edges] = debg(kmers)
 % write your function code here 
 % if kmers = {GTC, AGT}, then
 % vertices = {'GT', 'TC', 'AG'}
 % edges = [1 2; 3 1]
 
 count = 0;
 nodes = strings(2*size(kmers));
 k = numel(kmers{1});
 
 % nodes array %
 for i = 1:numel(kmers)
     idk = kmers(i);
     string = idk{1};
     const = string(1:k-1);
     count = count + 1;
     nodes(count) = const;
     const1 = string(2:k);
     count = count + 1;
     nodes(count) = const1;
 end 
 
 nodes = unique(nodes);
 vertices = nodes(nodes ~= ""); 
 
 edges = zeros(length(kmers),2);
 add = 1;
 for i = 1:numel(kmers)
     idk = kmers(i);
     string = idk{1};
     const = string(1:k-1);
     const1 = string(2:k);
     post1 = find(strcmp(vertices,const)); 
     
     % find the node's position in the vertices array 
     post2 = find(strcmp(vertices,const1));
     edges(add, 2) = post2;
     add = add + 1;
 end 

end

function ewalk = eulerian_walk(edges, vertices)
% write your function code here
% if edges  = [1 2; 3 1]
% then, ewalk = [3 1 2]
% if there are multiple Eulerian walks, just pick one of your choice 

stN = 0;
for i = 1:size(vertices)
    t = 0;
    for i = 1:length(edges) 
        if(edges(i,1) == i)
            t = t + 1;
        end
    end
    for i = 1:length(edges)
        if (edges(i,2) == i)
            t = t -1;
        end 
    end 
    if(t > 0 )
        stN = i;
        break;
    end
end

walk = [];
elist = edges;
cn = stN;
% defining current node %
stk = stN;
% defining stack %
while ~isempty(elist)|| ~isempty(stk) 
    rows = find(elist(:,1) == cn);
    if ~isempty(rows)
        stk = [stk cn];
        firstElement = rows(1);
        cn = elist(firstElement, 2);
        elist = edgelist(~ismember(1:size(elist, 1),firstElement),:);
    else 
        walk = [walk cn];
        cn = stk(end);
        stk(length(stk)) = [];
    end
end 
walk = fliplr(walk);
end

function re_seq = sequence(ewalk, vertices)
% write your code here
% if ewalk = [3 1 2] and vertices = {'GT', 'TC', 'AG'}
% the re_seq = 'AGTC'

re_seq = ""; 
for i = 1:length(walk)
    vertstr = vertices(walk(i));
    vertstr = extractBetween(vertstr,1,1);
    re_seq = re_seq + vertstr; 
end 
vertstr = extractAfter(vertstr,length(vertstr));
re_seq = re_seq + vertstr;
end


function kmers = gen_kmers(seq, k)
    i=length(seq);
    out={};
    for i=1:i-k+1
        out{i}=seq(i:i+k-1);
    end
    temp = randperm(length(out));    
    kmers = {};
    for i = 1:length(out)
        kmers{i} = out{temp(i)};
    end
end

function distance = edit_distance(string1, string2)
    m=length(string1);
    i=length(string2);
    v=zeros(m+1,i+1);
    for i=1:1:m
        v(i+1,1)=i;
    end
    for j=1:1:i
        v(1,j+1)=j;
    end
    for i=1:m
        for j=1:i
            if (string1(i) == string2(j))
                v(i+1,j+1)=v(i,j);
            else
                v(i+1,j+1)=1+min(min(v(i+1,j),v(i,j+1)),v(i,j));
            end
        end
    end
    distance=v(m+1,i+1);
end
