defmodule OtpZeldacatTest do
  use ExUnit.Case
  doctest OtpZeldacat

  test "a health component can return its hp" do
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, HealthComponent, 100)
    assert HealthComponent.get_hp(entity) == 100
  end

  test "an entity knows if it is alive" do 
    {:ok, entity1} = Entity.init()
    Entity.add_component(entity1, HealthComponent, 100)
    assert HealthComponent.get_hp(entity1) == 100
    assert HealthComponent.alive?(entity1) == true
    
    {:ok, entity2} = Entity.init()
    Entity.add_component(entity2, HealthComponent, -20)
    assert HealthComponent.get_hp(entity2) == -20
    assert HealthComponent.alive?(entity2) == false
  end

  test "an entity is notified when hit" do 
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, HealthComponent, 100)
    assert HealthComponent.get_hp(entity) == 100
    assert Entity.notify(entity, {:hit, 50}) == :ok
  end
  
  test "an entity loses HP when hit" do
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, HealthComponent, 100)
    assert HealthComponent.get_hp(entity) == 100
    Entity.notify(entity, {:hit, 50})
    assert HealthComponent.get_hp(entity) == 50
  end
  
  test "an entity gains HP when healed" do
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, HealthComponent, 100)
    assert HealthComponent.get_hp(entity) == 100
    Entity.notify(entity, {:heal, 50})
    assert HealthComponent.get_hp(entity) == 150
  end
  
  test "an entity with an HP above 0 is alive" do 
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, HealthComponent, 100)
    assert HealthComponent.alive?(entity) == true
  end
  
  test "an entity with an HP below 0 is dead" do 
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, HealthComponent, 10)
    Entity.notify(entity, {:hit, 50})
    assert HealthComponent.alive?(entity) == false
  end

  test "something with a health component can die" do
    {:ok, entity} = Entity.init()
    Entity.add_component(entity, HealthComponent, 100)
    assert HealthComponent.get_hp(entity) == 100
    assert HealthComponent.alive?(entity) == true
    Entity.notify(entity, {:hit, 50})
    assert HealthComponent.get_hp(entity) == 50
    Entity.notify(entity, {:heal, 25})
    assert HealthComponent.get_hp(entity) == 75
    Entity.notify(entity, {:hit, 75})
    assert HealthComponent.alive?(entity) == false
  end
end
