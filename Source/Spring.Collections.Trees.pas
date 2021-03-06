{ *************************************************************************** }
{                                                                             }
{ Proposed addition to the                                                    }
{           Spring Framework for Delphi                                       }
{                                                                             }
{ Copyright (c) 2009-2017 Spring4D Team                                       }
{                                                                             }
{ http://www.spring4d.org                                                     }
{                                                                             }
{ *************************************************************************** }
{                                                                             }
{ Licensed under the Apache License, Version 2.0 (the "License");             }
{ you may not use this file except in compliance with the License.            }
{ You may obtain a copy of the License at                                     }
{                                                                             }
{ http://www.apache.org/licenses/LICENSE-2.0                                  }
{                                                                             }
{ Unless required by applicable law or agreed to in writing, software         }
{ distributed under the License is distributed on an "AS IS" BASIS,           }
{ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    }
{ See the License for the specific language governing permissions and         }
{ limitations under the License.                                              }
{                                                                             }
{ *************************************************************************** }


unit Spring.Collections.Trees;

interface

uses
  System.Types,
  System.SysUtils,
  System.Generics.Defaults,
  System.Generics.Collections,
  Spring,
  Spring.Collections,
  Spring.Collections.Queues,
  Spring.Collections.Base,
  Spring.Collections.Sets,
  Spring.Collections.MiniStacks,
  Spring.Collections.Extensions,
  Spring.Collections.TreeIntf;

type

  Tree<T> = record
  public
    class function RedBlackTree(Species: TTreeSpecies = TD234): ITree<T>; overload; static;
    class function RedBlackTree(const Comparer: IComparer<T>; Species: TTreeSpecies = TD234): ITree<T>; overload; static;
    class function RedBlackTree(const Comparer: TComparison<T>; Species: TTreeSpecies = TD234): ITree<T>; overload; static;
    class function RedBlackTree(const Values: array of T; Species: TTreeSpecies = TD234): ITree<T>; overload; static;
    class function RedBlackTree(const Collection: IEnumerable<T>; Species: TTreeSpecies = TD234): ITree<T>; overload; static;
  end;

  Tree<K,V> = record
  public
    class function RedBlackTree(Species: TTreeSpecies = TD234): ITree<K,V>; overload; static;
    class function RedBlackTree(const Comparer: IComparer<K>; Species: TTreeSpecies = TD234): ITree<K,V>; overload; static;
    class function RedBlackTree(const Comparer: TComparison<K>; Species: TTreeSpecies = TD234): ITree<K,V>; overload; static;
    class function RedBlackTree(const Values: array of TPair<K,V>; Species: TTreeSpecies = TD234): ITree<K,V>; overload; static;
    class function RedBlackTree(const Collection: IEnumerable<TPair<K,V>>; Species: TTreeSpecies = TD234): ITree<K,V>; overload; static;
    class function BPlusTree: ITree<K,V>; overload; static;
    class function BPlusTree(const Comparer: IComparer<K>): ITree<K,V>; overload; static;
    class function BPlusTree(const Comparer: TComparison<K>): ITree<K,V>; overload; static;
    class function BPlusTree(const Values: array of TPair<K,V>): ITree<K,V>; overload; static;
    class function BPlusTree(const Collection: IEnumerable<TPair<K,V>>): ITree<K,V>; overload; static;
  end;

implementation

uses
  Spring.Collections.TreeImpl,
  Spring.Collections.BPlusTrees;

{ Tree<T> }

class function Tree<T>.RedBlackTree(const Comparer: IComparer<T>; Species: TTreeSpecies): ITree<T>;
begin
  Result:= TRedBlackTree<T>.Create(Comparer, Species);
end;

class function Tree<T>.RedBlackTree(Species: TTreeSpecies): ITree<T>;
begin
  Result:= TRedBlackTree<T>.Create(Species);
end;

class function Tree<T>.RedBlackTree(const Comparer: TComparison<T>; Species: TTreeSpecies): ITree<T>;
begin
  Result:= TRedBlackTree<T>.Create(Comparer, Species);
end;

class function Tree<T>.RedBlackTree(const Collection: IEnumerable<T>; Species: TTreeSpecies): ITree<T>;
begin
  Result:= TRedBlackTree<T>.Create(Collection, Species);
end;

class function Tree<T>.RedBlackTree(const Values: array of T; Species: TTreeSpecies): ITree<T>;
begin
  Result:= TRedBlackTree<T>.Create(Values, Species);
end;

{ Tree<K, V> }

class function Tree<K, V>.RedBlackTree(const Comparer: IComparer<K>; Species: TTreeSpecies): ITree<K, V>;
begin
  Result:= TRedBlackTree<K,V>.Create(Comparer, Species);
end;

class function Tree<K, V>.RedBlackTree(Species: TTreeSpecies): ITree<K, V>;
begin
  Result:= TRedBlackTree<K,V>.Create(Species);
end;

class function Tree<K, V>.BPlusTree(const Comparer: IComparer<K>): ITree<K, V>;
begin
  Result:= TBPlusTree<K,V>.Create(Comparer);
end;

class function Tree<K, V>.BPlusTree: ITree<K, V>;
begin
  Result:= TBPlusTree<K,V>.Create;
end;

class function Tree<K, V>.BPlusTree(const Comparer: TComparison<K>): ITree<K, V>;
begin

end;

class function Tree<K, V>.BPlusTree(const Collection: IEnumerable < TPair < K, V >> ): ITree<K, V>;
begin

end;

class function Tree<K, V>.BPlusTree(const Values: array of TPair<K, V>): ITree<K, V>;
begin

end;

class function Tree<K, V>.RedBlackTree(const Collection: IEnumerable<TPair<K, V>>; Species: TTreeSpecies): ITree<K, V>;
begin
  Result:= TRedBlackTree<K,V>.Create(Collection, Species);
end;

class function Tree<K, V>.RedBlackTree(const Values: array of TPair<K, V>; Species: TTreeSpecies): ITree<K, V>;
begin
  Result:= TRedBlackTree<K,V>.Create(Values, Species);
end;

class function Tree<K, V>.RedBlackTree(const Comparer: TComparison<K>; Species: TTreeSpecies): ITree<K, V>;
begin
  Result:= TRedBlackTree<K,V>.Create(Comparer, Species);
end;

end.
