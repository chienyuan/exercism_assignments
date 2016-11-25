defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    earth_year = seconds / 365.25 / 24 / 60 / 60
    cond do
      planet == :mercury -> earth_year / 0.2408467
      planet == :venus -> earth_year / 0.61519726
      planet == :mars -> earth_year / 1.8808158 
      planet == :jupiter -> earth_year / 11.862615 
      planet == :saturn -> earth_year / 29.447498
      planet == :uranus -> earth_year / 84.016846
      planet == :neptune -> earth_year / 164.79132
      true -> earth_year
    end
  end
  
end
