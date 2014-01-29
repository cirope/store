module EntitiesTestHelper
  def generic_entity_attributes
    {
      name: 'new',
      tax_id: '123',
      tax_condition: Entity::TAX_CONDITIONS.first,
      address: 'San Martín 324',
      city_id: cities(:godoy_cruz).id
    }
  end
end
