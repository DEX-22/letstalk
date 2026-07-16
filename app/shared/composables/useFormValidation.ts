import { toTypedSchema } from '@vee-validate/zod'
import { useForm, useField } from 'vee-validate'
import type { ZodSchema } from 'zod'

export function useFormValidation<T extends Record<string, unknown>>(
  schema: ZodSchema<T>,
) {
  const typedSchema = toTypedSchema(schema)

  const form = useForm<T>({
    validationSchema: typedSchema,
  })

  const { errors, handleSubmit, isSubmitting, setFieldValue } = form

  // Create a helper to get field values reactively
  function useFieldValue(fieldName: keyof T) {
    const field = useField(fieldName as string)
    return field.value
  }

  return {
    errors,
    handleSubmit,
    isSubmitting,
    setFieldValue,
    useFieldValue,
    form,
  }
}