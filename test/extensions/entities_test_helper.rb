module EntitiesTestHelper
  def generic_entity_attributes
    {
      name: 'new',
      tax_id: '123',
      tax_situation: 'responsible',
      city_id: cities(:godoy_cruz).id
    }
  end
end
