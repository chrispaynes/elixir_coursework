defmodule NucleotideCount do
  @moduledoc """
  Module that given a DNA string, computes how many times each nucleotide occurs in the string.

  DNA is represented by an alphabet of the following symbols: 'A', 'C',
  'G', and 'T'. Each symbol represents a nucleotide, which is a fancy name for the
  particular molecules that happen to make up a large part of DNA.
  DNA contains four types of them: adenine (`A`), cytosine (`C`), guanine
  (`G`), and thymine (`T`).
  """
  @nucleotides [?A, ?T, ?C, ?G]

  @doc """
   Counts how many times a nucleotide is found within a DNA String. 
  """
  @spec count(list, integer) :: non_neg_integer
  def count(dna_strand, nucleotide) do
    case dna_strand do
      '' -> 0
       _ -> Enum.count(dna_strand, &(&1 == nucleotide)) 
    end
  end

  @doc """
    Returns a histogram representing the frequency of each nucleotide in a DNA strand. 
  """
  @spec histogram(list) :: map
  def histogram(dna_strand) do
    Enum.map(@nucleotides, &{&1, count(dna_strand, &1)}) |> Enum.into(%{})
  end
end
